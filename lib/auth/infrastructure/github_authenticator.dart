// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';

import 'package:repo_viewer/auth/infrastructure/credential_storage/credential_storage.dart';

import 'package:http/http.dart' as http;
import 'package:repo_viewer/core/infrastructure/dio_extensions.dart';
import 'package:repo_viewer/core/shared/encoders.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  final CredentialStorage _credentialStorage;
  final Dio dio;

  GithubAuthenticator(this._credentialStorage, this.dio);

  static final authorizationEndPoint =
      Uri.parse('https://github.com/login/oauth/authorize');

  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');

  static final redirectUrl = Uri.parse('http://localhost:3000/callback');

  static final revocationEndPoint =
      Uri.parse('https://api.github.com/application/$clientID/token');

  static const clientID = '1c1adb4fdc565e8086fc';
  static const clientSecret = 'b4e705784478f11dc163d798908d7c330035fd84';
  static const scopes = [
    'admin:enterprise',
    'admin:gpg_key',
    'admin:org',
    'admin:org_hook',
    'admin:public_key',
    'admin:repo_hook',
    'admin:ssh_signing_key',
    'audit_log',
    'codespace',
    'delete:packages',
    'delete_repo',
    'gist',
    'notifications',
    'project',
    'repo',
    'user',
    'workflow',
    'write:discussion',
    'write:packages'
  ];

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialStorage.read();
      if (storedCredentials != null) {
        if (storedCredentials.isExpired && storedCredentials.isExpired) {
          final failureOrCredentials = await refresh(storedCredentials);
          failureOrCredentials.fold((l) => null, (r) => r);
        }
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((value) => value != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
        clientID, authorizationEndPoint, tokenEndpoint,
        secret: clientSecret, httpClient: GithubOAuthHttpClient());
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryparams,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queryparams);
      await _credentialStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server(error: '${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signedOut() async {
    final accessToken =
        await _credentialStorage.read().then((value) => value!.accessToken);

    final usernameAndPassword =
        stringToBase64.encode('$clientID:$clientSecret');

    try {
      try {
        //TODO: implement delete URI

        // dio.deleteUri(
        //   revocationEndPoint,
        //   data: {'access_token': accessToken},
        //   options: Options(
        //     headers: {'Authorization': 'basic $usernameAndPassword'},
        //   ),
        // );
      } on DioError catch (e) {
        if (e.isNullConnectionError) {
          // print(e);
        } else {
          rethrow;
        }
      }
      await _credentialStorage.clear();

      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
    Credentials credentials,
  ) async {
    try {
      final refreshCredentials = await credentials.refresh(
        identifier: clientID,
        secret: clientSecret,
        httpClient: GithubOAuthHttpClient(),
      );
      await _credentialStorage.save(refreshCredentials);

      return right(refreshCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server(error: '${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}

import 'package:diox/diox.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:repo_viewer/auth/infrastructure/credential_storage/credential_storage.dart';
import 'package:repo_viewer/auth/infrastructure/credential_storage/secure_credential_storage.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
import 'package:repo_viewer/auth/infrastructure/oauth2_interceptor.dart';

final dioForAuthProvider = Provider((ref) => Dio());

final oAuth2InterceptorProvider = Provider(
  (ref) => OAuth2Interceptor(
    ref.watch(githubAuthenticatorProvider),
    ref.watch(authNotifierProvider.notifier),
    ref.watch(dioForAuthProvider),
  ),
);

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final credentialsStorageProvider = Provider<CredentialStorage>(
    (ref) => SecureCredentialStorage(ref.watch(flutterSecureStorageProvider)));

final githubAuthenticatorProvider = Provider((ref) => GithubAuthenticator(
    ref.watch(credentialsStorageProvider), ref.watch(dioForAuthProvider)));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(githubAuthenticatorProvider)));

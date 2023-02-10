// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart';

import 'package:repo_viewer/auth/infrastructure/credential_storage/credential_storage.dart';

class SecureCredentialStorage implements CredentialStorage {
  final FlutterSecureStorage _storage;
  SecureCredentialStorage(
    this._storage,
  );

  Credentials? _cachedCredentials;

  static const _key = 'oauth2_cred';

  @override
  Future<void> clear() async {
    _cachedCredentials = null;
    _storage.delete(key: _key);
  }

  @override
  Future<Credentials?> read() async {
    if (_cachedCredentials != null) {
      return _cachedCredentials;
    }
    await _storage.read(key: _key);
    final json = await _storage.read(key: _key);
    if (json == null) {
      return null;
    }
    try {
      _cachedCredentials = Credentials.fromJson(json);
      return _cachedCredentials;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> save(Credentials credentials) {
    _cachedCredentials = credentials;
    return _storage.write(key: _key, value: credentials.toJson());
  }
}

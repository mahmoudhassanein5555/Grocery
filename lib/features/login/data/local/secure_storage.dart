import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocalauthDatasouce)
class SecureStorageDatasource extends LocalauthDatasouce {
  final FlutterSecureStorage storage;
  SecureStorageDatasource(this.storage);
  static const String _tokenkey = 'token';

  @override
  Future<String?> getToken() async {
    try {
      return await storage.read(key: _tokenkey);
    } catch (e) {
      throw LocalException('Something went wrong');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await storage.write(key: _tokenkey, value: token);
    } catch (e) {
      throw LocalException('Something went wrong');
    }
  }

  Future<void> deleteToken() async {
    try {
      await storage.delete(key: _tokenkey);
    } catch (e) {
      throw LocalException('Something went wrong');
    }
  }
}

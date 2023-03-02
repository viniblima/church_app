import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageControllerX extends GetxController {
  final storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: 'account_ecommerce',
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );

  Future<String?> get({required String key}) async {
    return await storage.read(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
      key: key,
    );
  }

  Future save({required String key, required String value}) async {
    return await storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> delete({required String key}) async {
    return await storage.delete(
      key: key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> deleteAll() async {
    return await storage.deleteAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageControllerX extends GetxController {
  final storage = const FlutterSecureStorage();

  Future<String?> get({required String key}) async {
    return await storage.read(
      key: key,
    );
  }

  Future save({required String key, required String value}) async {
    return await storage.write(
      key: key,
      value: value,
    );
  }

  Future<void> delete({required String key}) async {
    return await storage.delete(
      key: key,
    );
  }
}

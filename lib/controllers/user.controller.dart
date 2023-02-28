import 'package:church_app/controllers/storage.controller.dart';
import 'package:church_app/models/user.model.dart';
import 'package:get/get.dart';

class UserControllerX extends GetxController {
  String? token;
  String? refreshToken;
  User? user;

  Future<Map<String, String>> updateToken({
    required String newToken,
    required String newRefreshToken,
    required String expiresIn,
    required String refreshExpiresIn,
  }) async {
    final StorageControllerX storageControllerX =
        Get.find<StorageControllerX>();

    token = newToken;
    await storageControllerX.save(
      key: 'token',
      value: newToken,
    );
    await storageControllerX.save(
      key: 'token_expires_in',
      value: expiresIn,
    );

    refreshToken = newRefreshToken;
    await storageControllerX.save(
      key: 'refresh_token',
      value: newRefreshToken,
    );
    await storageControllerX.save(
      key: 'refresh_token_expires_in',
      value: refreshExpiresIn,
    );

    return {
      "Token": newToken,
      "Refresh": newRefreshToken,
    };
  }

  Future<User?> updateUser({
    required Map<String, dynamic> userMap,
  }) async {
    final StorageControllerX storageControllerX =
        Get.find<StorageControllerX>();

    user = User.fromMap(userMap);
    await storageControllerX.save(
      key: 'user_name',
      value: user!.name,
    );
    await storageControllerX.save(
      key: 'user_email',
      value: user!.email,
    );
    await storageControllerX.save(
      key: 'user_id',
      value: user!.id,
    );

    return user;
  }
}

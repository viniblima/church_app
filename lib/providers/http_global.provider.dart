import 'package:church_app/controllers/user.controller.dart';
import 'package:church_app/providers/user.provider.dart';
import 'package:church_app/widgets/modal_login.widget.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

// import 'dart:developer' as developer;

class HttpProvider extends GetConnect {
  Future<Response?> httpGet(
      {required String address, bool protectedAPI = true}) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();

    // developer.log("protectedAPI", error: protectedAPI);

    // developer.log("userControllerX.token", error: userControllerX.token);

    if (protectedAPI && userControllerX.token == null) {
      Map<String, bool> result = await Get.bottomSheet(
        const ModalLogin(),
        isDismissible: true,
      );

      if (result["logged"] == false) {
        return null;
      }
    }

    Response response = await get(
      "${Config.baseUrl}$address",
      headers: {
        'Authorization': 'JWT ${userControllerX.token}',
      },
    ).timeout(
      const Duration(seconds: 90),
    );

    if (response.statusCode == 401) {
      UserProvider userProvider = UserProvider();
      await userProvider.refreshToken();
      response = await get(
        "${Config.baseUrl}$address",
        headers: {
          'Authorization': 'JWT ${userControllerX.token}',
        },
      ).timeout(
        const Duration(seconds: 90),
      );
      return response;
    }
    return response;
  }

  /// Http post global
  ///
  /// [address] - Endereco da requisicao
  ///
  /// [refreshRequisition] - Tag to identifies if the requisition that will update the token
  ///
  /// [protectedAPI] - Tag to identifies if the API is protected by a valid JWT
  ///
  /// [isModalLogin] - Tag to identifies if the function have to ignore the others tags
  ///
  Future<Response?> httpPost({
    required String address,
    required Map<String, dynamic> obj,
    bool refreshRequisition = false,
    bool protectedAPI = true,
    bool isModalLogin = false,
  }) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();

    // developer.log("protectedAPI", error: protectedAPI);

    // developer.log("userControllerX.token", error: userControllerX.token);

    // developer.log("isModalLogin", error: isModalLogin);

    String? token = refreshRequisition
        ? userControllerX.refreshToken
        : userControllerX.token;

    if (!isModalLogin) {
      if (protectedAPI && userControllerX.token == null) {
        Map<String, bool>? result = await Get.bottomSheet(
          const ModalLogin(),
          isDismissible: true,
        );

        if (result == null || result["logged"] == false) {
          return null;
        }
      }
    }
    Response response = await post(
      "${Config.baseUrl}$address",
      headers: protectedAPI && !isModalLogin
          ? {
              'Authorization': 'JWT $token',
            }
          : null,
      obj,
    ).timeout(
      const Duration(seconds: 90),
    );

    if (response.statusCode == 401 && !isModalLogin) {
      UserProvider userProvider = UserProvider();
      await userProvider.refreshToken();

      response = await post(
        "${Config.baseUrl}$address",
        headers: {
          'Authorization': 'JWT $token',
        },
        obj,
      ).timeout(
        const Duration(seconds: 90),
      );
    }

    return response;
  }
}

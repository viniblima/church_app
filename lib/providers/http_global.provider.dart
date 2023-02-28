import 'package:church_app/controllers/user.controller.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class HttpProvider extends GetConnect {
  Future<Response> httpGet({
    required String address,
  }) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();

    Response response = await get(
      "${Config.baseUrl}$address",
      headers: {
        'Authorization': 'JWT ${userControllerX.token}',
      },
    ).timeout(
      const Duration(seconds: 90),
    );
    return response;
  }

  Future<Response> httpPost({
    required String address,
    required Map<String, dynamic> obj,
    bool refreshRequisition = false,
  }) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();

    String? token = refreshRequisition
        ? userControllerX.refreshToken
        : userControllerX.token;

    Response response = await post(
      "${Config.baseUrl}$address",
      headers: {
        'Authorization': 'JWT $token',
      },
      obj,
    ).timeout(
      const Duration(seconds: 90),
    );
    return response;
  }
}

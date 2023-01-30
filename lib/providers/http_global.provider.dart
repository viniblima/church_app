import 'package:church_app/controllers/user.controller.dart';
import 'package:get/get.dart';

class HttpProvider extends GetConnect {
  Future<Response> httpGet({
    required String address,
  }) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();

    Response response = await get(
      address,
      headers: {
        'Authorization': 'Bearer ${userControllerX.token}',
      },
    ).timeout(
      const Duration(seconds: 90),
    );
    return response;
  }

  Future<Response> httpPost({
    required String address,
    required Map<String, dynamic> obj,
  }) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();

    Response response = await post(
      address,
      headers: {
        'Authorization': 'Bearer ${userControllerX.token}',
      },
      obj,
    ).timeout(
      const Duration(seconds: 90),
    );
    return response;
  }
}

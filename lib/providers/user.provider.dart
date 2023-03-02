import 'package:church_app/controllers/user.controller.dart';
import 'package:get/get.dart';
import 'http_global.provider.dart';

class UserProvider extends GetConnect {
  final HttpProvider _httpProvider = HttpProvider();

  final UserControllerX _userControllerX = Get.find<UserControllerX>();

  Future<Response> refreshToken() async {
    Response response = await _httpProvider.httpPost(
      address: "/token/refresh",
      obj: {},
      refreshRequisition: true,
    );
    if (response.statusCode == 200) {
      await _userControllerX.updateToken(
        newToken: response.body["Auth"]["Token"]["Hash"],
        expiresIn: response.body["Auth"]["Token"]["ExpiresIn"],
        newRefreshToken: response.body["Auth"]["Refresh"]["Hash"],
        refreshExpiresIn: response.body["Auth"]["Refresh"]["ExpiresIn"],
      );
    }

    return response;
  }

  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "Name": name,
      "Email": email,
      "Password": password
    };

    Response response = await _httpProvider.httpPost(
      address: "/user/signup",
      obj: body,
    );

    if (response.statusCode == 201) {
      await _userControllerX.updateUser(
        userMap: response.body["User"],
      );

      await _userControllerX.updateToken(
        newToken: response.body["Auth"]["Token"]["Hash"],
        expiresIn: response.body["Auth"]["Token"]["ExpiresIn"],
        newRefreshToken: response.body["Auth"]["Refresh"]["Hash"],
        refreshExpiresIn: response.body["Auth"]["Refresh"]["ExpiresIn"],
      );
    }
    return response;
  }

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "Email": email,
      "Password": password,
    };

    Response response = await _httpProvider.httpPost(
      address: "/user/signin",
      obj: body,
    );

    if (response.statusCode == 200) {
      await _userControllerX.updateUser(
        userMap: response.body["User"],
      );

      await _userControllerX.updateToken(
        newToken: response.body["Auth"]["Token"]["Hash"],
        expiresIn: response.body["Auth"]["Token"]["ExpiresIn"],
        newRefreshToken: response.body["Auth"]["Refresh"]["Hash"],
        refreshExpiresIn: response.body["Auth"]["Refresh"]["ExpiresIn"],
      );
    }
    return response;
  }
}

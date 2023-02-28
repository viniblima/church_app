import 'package:church_app/controllers/storage.controller.dart';
import 'package:church_app/controllers/user.controller.dart';
import 'package:church_app/providers/user.provider.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class InitControllerX extends GetxController {
  final StorageControllerX _storageControllerX = Get.find<StorageControllerX>();
  final LocalAuthentication auth = LocalAuthentication();

  void getInit() {
    auth.isDeviceSupported().then((bool isSupported) async {
      // List<BiometricType> availableBiometrics =
      //     await auth.getAvailableBiometrics();

      // print(availableBiometrics);

      // bool authenticated = await auth.authenticate(
      //   localizedReason: '',
      //   options: const AuthenticationOptions(
      //     stickyAuth: true,
      //   ),
      // );

      // print(authenticated);

      String? token = await _storageControllerX.get(
        key: 'token',
      );

      String? tokenExpiresIn =
          await _storageControllerX.get(key: 'token_expires_in');

      String? refreshToken = await _storageControllerX.get(
        key: 'refresh_token',
      );

      String? refreshTokenExpiresIn = await _storageControllerX.get(
        key: 'refresh_token_expires_in',
      );

      if (tokenExpiresIn != null &&
          token != null &&
          refreshTokenExpiresIn != null &&
          DateTime.parse(refreshTokenExpiresIn).isAfter(
            DateTime.now(),
          )) {
        UserControllerX userControllerX = Get.find<UserControllerX>();

        if (DateTime.parse(tokenExpiresIn).isBefore(DateTime.now())) {
          UserProvider userProvider = UserProvider();

          await userProvider.refreshToken();
        } else {
          userControllerX.token = token;
          userControllerX.refreshToken = refreshToken;
        }

        Get.offAndToNamed('initial_tabs');
      } else {
        Get.offAndToNamed('login');
      }
    });
  }
}

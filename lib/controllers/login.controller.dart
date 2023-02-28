import 'package:get/get.dart';

class LoginControllerX extends GetxController {
  RxBool signUpLoading = RxBool(false);
  RxBool loginLoading = RxBool(false);

  updateSignUpLoading({required bool value}) {
    signUpLoading.update((val) {
      val = value;
    });
    update();
  }

  updateLoginLoading({required bool value}) {
    loginLoading.value = value;
    update();
  }
}

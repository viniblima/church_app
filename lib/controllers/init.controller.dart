import 'package:church_app/pages/initial_tabs.page.dart';
import 'package:get/get.dart';

class InitControllerX extends GetxController {
  void getInit() async {
    Get.offAll(
      () => const InitialTabsPage(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
      opaque: true,
    );
  }
}

import 'package:flutter_versionone/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

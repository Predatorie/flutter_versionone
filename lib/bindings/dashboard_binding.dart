import 'package:flutter_versionone/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}

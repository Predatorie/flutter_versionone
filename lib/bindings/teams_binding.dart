import 'package:flutter_versionone/controllers/teams_controller.dart';
import 'package:get/get.dart';

class TeamsBinding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.lazyPut<TeamsController>(() => TeamsController());
  }
}

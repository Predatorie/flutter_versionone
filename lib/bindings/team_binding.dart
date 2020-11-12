import 'package:flutter_versionone/controllers/team_controller.dart';
import 'package:get/get.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.lazyPut<TeamController>(() => TeamController());
  }
}

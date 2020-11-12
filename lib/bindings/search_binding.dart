import 'package:flutter_versionone/controllers/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.lazyPut<SearchController>(() => SearchController());
  }
}

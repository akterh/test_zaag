import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class TestBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ListController());
  }
}

import 'package:get/get.dart';

import '../controllers/login_form_controller.dart';

class FormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormController());
  }
}
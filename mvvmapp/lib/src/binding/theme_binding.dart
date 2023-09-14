import 'package:get/get.dart';
import 'package:mvvmapp/src/controller/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    print("popopopopopopopo");
     Get.lazyPut(() => TheamController());
  }
}
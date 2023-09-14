import 'package:get/get.dart';
import 'package:mvvmapp/src/controller/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    print("y00000000000000");
    Get.lazyPut(() => NetworkController());
  }
}
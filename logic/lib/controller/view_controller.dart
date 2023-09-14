import 'package:get/get.dart';

class ViewController extends GetxController {
   RxBool isListView = true.obs;

  void toggleView() {
    isListView.value = !isListView.value;
  }
}
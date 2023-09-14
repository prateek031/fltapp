// counter_controller.dart
import 'package:get/get.dart';

class CounterController extends GetxController {
  List<RxInt> counters = List.generate(20, (index) => 0.obs);


  void increment(int index) {
    counters[index].value++;
  }

  void decrement(int index) {
    if (counters[index].value > 0) {
      counters[index].value--;
    }
  }
}

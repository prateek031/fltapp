import 'package:get/get.dart';

import '../../services/api/movie_remote_services.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    print("yeeeeeeeeeeeeeeeeeeeeeee");
    Get.lazyPut(() => MoviesController());
  }
}
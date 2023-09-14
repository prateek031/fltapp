import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:mvvmapp/core/utils/helper.dart';

class MoviesController extends GetxController {
  final Dio _dio = Dio();
  RxList<Map<String, dynamic>> movies = <Map<String, dynamic>>[].obs;
  RxBool isLoading = true.obs;
  RxString error = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final apiUrl = dotenv.env['API_URL'].toString();
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        final results = data['results'];
        movies.assignAll(results.cast<Map<String, dynamic>>());
        isLoading.value = false;
      } else {
        error.value = "Error: ${response.statusCode}";
      }
      isLoading.value = false;
    }
on SocketException catch(e){
  Helper().tostMessage("exception caught $e ");
}     catch (e) {
      error.value = "Exception: $e";
      Get.snackbar("Exception", e.toString());
      Helper().tostMessage("exception $e");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}

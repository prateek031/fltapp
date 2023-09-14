// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:dio/dio.dart';

class CategoriesService {
  final Dio dio = Dio();
  final String baseUrl = 'http://stagingapi.shreesaidarshan.com/api/';

  Future<Response> getCategories(String token) async {
    try {
      final response = await dio.get(
        '${baseUrl}customer/get-categories',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } catch (e) {
      print(" Error from categories api $e");
      throw e;
    }
  }
}
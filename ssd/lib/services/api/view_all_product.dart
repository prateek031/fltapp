// ignore_for_file: use_rethrow_when_possible

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'http://stagingapi.shreesaidarshan.com/api/';
  }

  Future<Response> findProducts(  {int page =1}) async {
    try {
      print("this is page $page");
      final formData = FormData.fromMap({
        'online': true,
        'limit': 20,
        'page': page,
      });

      final response = await _dio.post(
        'customer/find-product-all-v8',
        data: formData,
        options: Options(
          headers: {
            'Authorization':
                'Bearer hWVqhMrErovDpNBxxab2yCb3hVf7N8QKN698GCujXs3tbdRfjB',
          },
        ),
      );

      return response;
    } catch (e) {
      // ignore: avoid_print
      print("this error is from view all product api $e");
      throw e;
    }

      
  }


}
// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'package:dio/dio.dart';

class CategoryProductService {
  final Dio _dio = Dio();

  CategoryProductService() {
    _dio.options.baseUrl = 'http://stagingapi.shreesaidarshan.com/api/';
  }

  Future<Response> findgroupProducts({int? category}) async {
    try {
  
      final formData = FormData.fromMap({
        'online': true,
        'limit': 20,
        'page': 1,
        'category':category,
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
      print("this error is from view all product api $e");
      throw e;
    }

      
  }


}
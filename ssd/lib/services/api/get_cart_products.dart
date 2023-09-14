import 'package:dio/dio.dart';

class GetCartService {
  final Dio _dio = Dio();

  static const String baseUrl = 'http://stagingapi.shreesaidarshan.com/api/';

  Future<Response> getCart() async {
        try {
          print('${baseUrl}customer/get-cart');
      final response = await _dio.post(
        
        '${baseUrl}customer/get-cart',
        data: FormData.fromMap({
          'type': 'ONLINE',
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer hWVqhMrErovDpNBxxab2yCb3hVf7N8QKN698GCujXs3tbdRfjB',
          },
        ),
      );
      return response;
    } 
     catch (error) {

      print(error);
      throw Exception('Failed to get the cart: ${(error as DioException).response}');
    }
  }
}
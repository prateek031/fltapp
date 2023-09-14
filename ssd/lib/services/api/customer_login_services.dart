// ignore_for_file: use_rethrow_when_possible, prefer_final_fields, avoid_print

import 'package:dio/dio.dart';

class CustomerLoginService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://stagingapi.shreesaidarshan.com/api/',
    ),
  );

  Future<Response> login(String mobileNumber, String password) async {
    try {
      final response = await _dio.post(
        'customer/customer-app-login',
        data: {
          'mobile': mobileNumber,
          'password': password,
        },
      );
      return response;
    } catch (error) {
      print("this error is from login api $error");
      throw error;
    }
  }
}

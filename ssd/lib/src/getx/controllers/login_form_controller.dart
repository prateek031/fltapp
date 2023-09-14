// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ssd/services/api/customer_login_services.dart';
import '../../../services/routes/routes.dart';

class FormController extends GetxController {
  final CustomerLoginService customerLoginService = CustomerLoginService();

  var mobile = ''.obs;
  var password = ''.obs;
  var passwordVisible = false.obs;
  var isLoading = false.obs;
  var token;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  bool validateForm() {
    if (mobile.value.length != 10 || password.value.length != 6) {
      return false;
    }
    return true;
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (validateForm()) {
      try {
        isLoading.value = true;
        final response =
            await customerLoginService.login(mobile.value, password.value);

        if (response.statusCode == 200) {
           final responseData = response.data;
             token= responseData['data']['api_token']; 
             prefs.setString('token', token);
          Get.offNamed(Routes.HomePage);
        } else {
          Get.snackbar(
            'Login Failed',
            'Invalid credentials. Please try again.',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (error) {
        print("this error is from login controller $error");
        Get.snackbar(
          'Error',
          'An error occurred. Please try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        'Validation Error',
        'Please check your input. Mobile number must be 10 digits, and password must be 6 characters.',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }
}

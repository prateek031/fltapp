// ignore_for_file: prefer_const_constructors

import 'package:blogapp/views/login/loginpage.dart';
import 'package:blogapp/views/uploadblog/blogbook%20copy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/googleauthcontroller.dart';


class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.put(Logincontroller());
  final User? currentUser = FirebaseAuth.instance.currentUser;


    return Obx((){
        if (controller.GoogleAccount.value == null && currentUser == null) {
        return LoginPage();
      } else {
        return BlogBook();
      }
    });
  }
}
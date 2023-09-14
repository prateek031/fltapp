// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:blogapp/views/login/googleauthcontroller.dart';
import 'package:blogapp/views/utils/splashscreen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  kIsWeb
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
          apiKey: "AIzaSyBfxPJTVMImf3clIWalIam3efOMfi0HkV8",
          projectId: "flutterblog-1567d",
          messagingSenderId: "630202565687",
          appId: "1:630202565687:web:ef48c04a4ea3cbc627abb2",
        ))
      : await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );
  final controller = Get.put(Logincontroller());
  print("thiss is goooooooglllllll user ${controller.GoogleAccount.value}");
  final User? currentUser = FirebaseAuth.instance.currentUser;
  print("thisssssssss is userrrrr ${currentUser?.uid}");


  runApp(GetMaterialApp(
    home: Splashscreen(),
    // home: Obx(() {
    //   if (controller.GoogleAccount.value == null && currentUser == null) {
    //     return LoginPage();
    //   } else {
    //     return UserBlogs();
    //   }
    // }),
    theme: ThemeData.dark(),
  ));
}

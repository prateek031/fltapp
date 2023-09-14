// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/services/routes/routes.dart';
import 'core/theme/theme.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? "";
  
  
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        
        return GetMaterialApp(
          
          debugShowCheckedModeBanner: false,
          theme: CustomThemes.light,
          darkTheme: CustomThemes.dark,
           initialRoute: token == "" ? Routes.LogInPage : Routes.HomePage,
          getPages: getPages,
        );
      },
    ),
  );
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvmapp/core/theme/colours.dart';
import 'package:sizer/sizer.dart';

class CustomThemes {
  static ThemeData get light => ThemeData.light().copyWith(
        primaryColorLight: PRIMARYCOLOR,
        brightness: Brightness.dark,
        primaryColor: PRIMARYCOLOR,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Mitr',
            color: LIGHTTEXTTHEME1,
            fontWeight: FontWeight.w300,
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 35.sp,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Mitr',
            color: LIGHTTEXTTHEME1,
            fontWeight: FontWeight.w300,
            fontSize: SizerUtil.deviceType == DeviceType.web ? 7.0.sp : 17.sp,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Mitr',
            color: LIGHTTEXTTHEME1,
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 16.sp,
          ),
          bodySmall: TextStyle(
            color: LIGHTTEXTTHEME1,
            fontFamily: 'Mitr',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 14.sp,
          ),
        ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        primaryColorLight: PRIMARYCOLOR,
        brightness: Brightness.light,
        primaryColor: PRIMARYCOLOR,
        scaffoldBackgroundColor: BACKGROUNDCOLOR,
        appBarTheme: AppBarTheme(
          backgroundColor: APPBARBG,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: TEXTTHEME1,
            fontFamily: 'Mitr',
            fontWeight: FontWeight.w300,
           fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 35.sp,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Mitr',
            color: TEXTTHEME1,
            fontWeight: FontWeight.w300,
           fontSize: SizerUtil.deviceType == DeviceType.web ? 7.0.sp : 17.sp,

          ),
          bodyMedium: TextStyle(
            fontFamily: 'Mitr',
            color: Color.fromARGB(255, 255, 255, 255),
           fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 16.sp,
          ),
          bodySmall: TextStyle(
            color: TEXTTHEME1,
            fontFamily: 'Mitr',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 14.sp,
          ),
        ),
      );
}

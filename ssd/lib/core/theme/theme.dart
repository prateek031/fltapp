// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class CustomThemes {
  static ThemeData get light => ThemeData.light().copyWith(
            textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w700,
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 20.sp,
          ),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 20.sp,
          ),
          bodyMedium: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 15.sp,
          ),
          headlineMedium: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 15.sp,
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 12.sp,
          ),
            bodySmall: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 12.sp,
          ),
        ),
      );
  static ThemeData get dark => ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'opensans',
           fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 20.sp,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'opensans',
           fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 20.sp,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'opensans',
           fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 15.sp,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 15.sp,
          ),
            headlineSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 12.sp,
          ),
            bodySmall: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'opensans',
            fontSize: SizerUtil.deviceType == DeviceType.web ? 8.0.sp : 12.sp,
          ),
        ),
      );
}

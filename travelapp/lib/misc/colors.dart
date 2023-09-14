// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



  class LightTheme{
    
   static const Color MAINCOLOR = Color.fromARGB(255, 148, 8, 8);
   static const Color HEADING = Colors.black;
   static const Color HEADING2 = Color.fromARGB(255, 87, 84, 84);
   static Color HEADING3 =  Colors.black.withOpacity(0.5);
   static Color LOCATIONICON =  const Color.fromARGB(255, 8, 124, 219).withOpacity(0.3);
   static Color LOCATIONTEXT = const Color.fromARGB(255, 21, 84, 136);
   static Color WIDGETCOLORWITHOPC =Color.fromARGB(255, 5, 5, 5).withOpacity(0.3);
   static const Color BACKGROUNDCOLOR = Color.fromARGB(255, 238, 237, 233);
   static const Color SUBHEADING = Color.fromARGB(255, 51, 51, 51);
   static const Color TEXTCOLOR = Colors.black;
   static const Color TEXTCOLOR2 = Colors.white;
   static const Color CARDTEXTCOLOR = Colors.white;
   static const Color BUTTOMWIDGETCOLOR = Color.fromARGB(255, 5, 5, 5);
   static const Color WIDGETCOLOR = Color.fromARGB(255, 5, 5, 5);
   static const Color BUTTONBGCOLOR = Color.fromARGB(255, 4, 144, 209);
   static const Color STARCOLOR = Color.fromARGB(255, 255, 192, 4);
   static const Color STARCOLORNS = Color.fromARGB(220, 214, 162, 19);
   static const Color SELECTORBGCOLOR = Color.fromARGB(255, 228, 228, 228);
  }

    
   class CustomThemes{
  
   static const Color MAINCOLOR =  Color.fromARGB(255, 148, 8, 8);
   static const Color HEADING = Colors.black;
   static const Color HEADING2 = Color.fromARGB(255, 236, 229, 229);
   static  Color HEADING3 =  Color.fromARGB(255, 255, 255, 255);
   static  Color LOCATIONICON =   Color.fromARGB(255, 2, 170, 248).withOpacity(0.3);
   static const LOCATIONTEXT =  Color.fromARGB(255, 15, 122, 209);
   static  Color  WIDGETCOLORWITHOPC = Color.fromARGB(255, 206, 206, 206).withOpacity(0.3);
   static const Color BACKGROUNDCOLOR = Color.fromARGB(255, 124, 121, 121);
   static const Color SUBHEADING = Color.fromARGB(255, 231, 225, 225);
   static const Color TEXTCOLOR = Color.fromARGB(255, 255, 252, 252);
   static const Color TEXTCOLOR2 = Color.fromARGB(255, 19, 19, 19);
   static const Color CARDTEXTCOLOR = Color.fromARGB(255, 240, 237, 237);
   static const Color BUTTOMWIDGETCOLOR = Color.fromARGB(255, 17, 17, 17);
   static const Color WIDGETCOLOR = Color.fromARGB(255, 223, 217, 217);
   static const Color BUTTONBGCOLOR = Color.fromARGB(255, 61, 59, 59);
   static const Color STARCOLOR = Color.fromARGB(255, 255, 192, 4);
   static const Color STARCOLORNS = Color.fromARGB(220, 214, 162, 19);
   static const Color SELECTORBGCOLOR = Color.fromARGB(255, 175, 174, 174);

    static ThemeData get  light => ThemeData.light().copyWith(
    primaryColor: MAINCOLOR,
    unselectedWidgetColor:Color.fromARGB(255, 17, 17, 17) ,
    scaffoldBackgroundColor: Color.fromARGB(255, 24, 23, 23),
    textTheme: TextTheme(
       displayLarge: TextStyle(fontSize:8, fontWeight: FontWeight.bold, color:  const Color.fromARGB(255, 255, 255, 255)),
       titleLarge: TextStyle(color:HEADING3 ,fontSize: 25.sp,),
       titleMedium: TextStyle(fontSize: 16.sp, color: TEXTCOLOR2),  
       displayMedium: TextStyle(fontSize: 16.sp, color: TEXTCOLOR2),  
       labelMedium: TextStyle(fontSize: 20.sp , )
        

    ),
  );
      
    }


// Color white =Color.fromARGB(255, 255, 0, 0);
// Color black =Color.fromARGB(255, 208, 255, 1);

// class Themeeee{
//  static ThemeData get dark => ThemeData.dark().copyWith(
//   scaffoldBackgroundColor: Colors.red,
//     textTheme: TextTheme(
//        displayMedium: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: white),
        
//     ),
//   );

//   static ThemeData get light => ThemeData.light().copyWith(
//     textTheme: TextTheme(
//        displayMedium: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color:  black),
       
//     ),
//   );


// }

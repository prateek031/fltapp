// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AppText extends StatelessWidget {
  String text;
  double size;
  Color color;
  

  AppText({super.key,
  this.size=16,
  required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    
    return Text(
      text,
      style:GoogleFonts.caveat(textStyle:TextStyle(
        fontWeight: FontWeight.w400,
       fontSize:size, 
      ), ) 
   
    );
  }
}
// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppLargeText extends StatelessWidget {
  double size;
  final String text;
   Color color;
   AppLargeText({super.key, this.size=35,required this.text,this.color=const Color.fromARGB(255, 0, 0, 0)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:GoogleFonts.pacifico(
        textStyle:  TextStyle(
        
        color: color,
          fontSize: size,
        fontWeight: FontWeight.bold
      ),
      )
      
    );
  }
}
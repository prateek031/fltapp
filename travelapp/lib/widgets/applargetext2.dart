// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText2 extends StatelessWidget {
  String text;
  double size;
  Color color;
  AppLargeText2({super.key,
  required this.text,
  this.size=25,
  this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mitr(textStyle: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400
      ) ),
    );
  }
}
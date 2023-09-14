// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Blankpage extends StatelessWidget {
  const Blankpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("asset/images/nointernet.gif"),
      ),
    );
  }
}
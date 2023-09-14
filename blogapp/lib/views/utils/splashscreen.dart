// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:blogapp/views/utils/controllerpage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
  
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ControllerPage(),
          ),
      );  
         
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('asset/images/load.gif'),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("W",
                style: TextStyle(
                  color: Color.fromARGB(255, 253, 217, 9),
                  fontSize: 50,
                ),
                ),
                Text("elcome",
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 104, 17),
                  fontSize: 35,
                ),
                ),
              ],)
          ],
        ),
      )
    );
  }
}
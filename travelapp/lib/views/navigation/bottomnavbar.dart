// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/views/detailspage.dart';
import 'package:travelapp/views/navigation/baritems.dart';
import 'package:travelapp/views/navigation/homepage/homepage.dart';
import 'package:travelapp/views/navigation/profilepage.dart';



class NavController extends StatefulWidget {
  const NavController({super.key});

  @override
  State<NavController> createState() => _NavControllerState();
}

class _NavControllerState extends State<NavController> {
  int currentIndex=0;
  void changeIndex(index){
    setState(() {
      currentIndex=index;
    });
  }
   List Pages=[
    HomePage(),
    DetailsPage(),
    BarItems(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        body: Pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: changeIndex,
          currentIndex: currentIndex,
          selectedItemColor: LightTheme.BUTTOMWIDGETCOLOR,
          unselectedItemColor:  LightTheme.BUTTOMWIDGETCOLOR.withOpacity(0.3),
          
          elevation: 10,
          items:[
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:"Explore",icon: Icon(Icons.explore)),
          BottomNavigationBarItem(label:"Bars",icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label:"Profile",icon: Icon(Icons.person)),

        ]),
      );
  }
}

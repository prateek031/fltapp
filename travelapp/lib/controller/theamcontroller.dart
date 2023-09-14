import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TheamController extends GetxController{
  var isDark=false;

  changeTheame(state){
    if(state==true){
      isDark=true;
      Get.changeThemeMode(ThemeMode.dark);
    }
    else{
      isDark=false;
        Get.changeThemeMode(ThemeMode.light);

    }
    update();
  }
}
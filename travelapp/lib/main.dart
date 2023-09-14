// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/views/navigation/bottomnavbar.dart';
import 'package:travelapp/views/utils/Nointernetpage.dart';
import 'package:travelapp/controller/networkcontroller.dart';
import 'package:travelapp/views/myapp.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
   App({super.key});

  @override
  State<App> createState() => _AppState();
  
}
 var user=false; 

class _AppState extends State<App> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
     user = await userVisistCheck();
     print("thissssss is usre $user");
     });
  
    super.initState();
  }
    userVisistCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? visited = prefs.getBool('UserVisited');
    print("thiss is visited $visited");
    if (visited != null) {
      return visited;
    }
  }

  @override
  Widget build(BuildContext context) {
    NetworkController networkController = Get.put(NetworkController());

    print("user $user");
    
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Obx(() {
          if (networkController.connectiontype == true) {
            if(user==true){
              print("somthing is wrong");
              return NavController();
            }else{
              print("somthing is wrong2");

              return MyApp();
            }
          } else {
            return Blankpage();
          }
        }),
      );
    });
  }


}

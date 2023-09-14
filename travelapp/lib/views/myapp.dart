// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/views/navigation/bottomnavbar.dart';
import 'package:travelapp/views/pref.dart';
import 'package:travelapp/widgets/apptext.dart';
import 'package:travelapp/widgets/largetext.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List imgList = [
      "tv1.jpg",
      "tv2.jpeg",
      "tv3.jpeg",
    ];
    List place = ["......Valley", "......Roads", "Mountains"];
    List icons = ["vl.png", "ro.png", "mon.png"];
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: imgList.length,
            itemBuilder: (_, index) {
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/${imgList[index]}"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(220, 255, 255, 255),
                          BlendMode.darken)),
                ),
                child: Container(
                  width: 30.w,
                  margin: EdgeInsets.only(
                      top: 20.h, right: 15.w, left: 10.w, bottom: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            size: 30.sp,
                            text: "Trip To",
                          ),
                          AppText(
                            text: place[index].toString(),
                            size: 30.sp, color: LightTheme.SUBHEADING,
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Container(
                            width: 200.sp,
                            child: AppText(
                              size: 15.sp,
                              text:
                                  "Mountains hikes gives you a incrediable sence of freedom along with endurance test.",
                              color: LightTheme.TEXTCOLOR,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(111, 255, 254, 254)),
                              onPressed: ()async{
                               
                                await UserVisited().userVisited();
                                Get.offAll(NavController());
                              },
                              icon: Padding(
                                padding:  EdgeInsets.all(0.5.h),
                                child: Image.asset(
                                  "asset/images/${icons[index]}",
                                  height: 5.0.h,
                                  width: 15.0.w,
                                ),
                              ),
                              label: Text(
                                "Trip to ${place[index]}",
                                style: GoogleFonts.caveat(
                                  textStyle: TextStyle(
                                    fontSize: 15.sp
                                  )
                                ),
                              ))
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 0.3.h),
                            width: 1.5.w,
                            height: index == indexDots ? 4.h : 1.5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? LightTheme.MAINCOLOR
                                  : LightTheme.MAINCOLOR.withOpacity(0.4),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

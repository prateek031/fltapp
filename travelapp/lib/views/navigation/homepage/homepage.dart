// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/controller/beachscontroller.dart';
import 'package:travelapp/controller/locationcontroller.dart';
import 'package:travelapp/controller/mountaincontroller.dart';
import 'package:travelapp/controller/theamcontroller.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/apptext.dart';
import 'package:travelapp/widgets/exploreicons.dart';
import 'package:travelapp/widgets/largetext.dart';
import 'package:travelapp/views/navigation/homepage/locationdata.dart';

import 'activityicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final LoacationControllar loacationcontrollar =
      Get.put(LoacationControllar());
  final BeachesControllar beachescontrollar = Get.put(BeachesControllar());
  final MountainControllar mountaincontrollar = Get.put(MountainControllar());
  final TheamController theamcontrollar = Get.put(TheamController());
  
  

  @override
  void initState() {
    // LoacationControllar().fetchLoaction();
    // BeachesControllar().fetchLoaction();
    // MountainControllar().fetchLoaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ActivityIcon _data = ActivityIcon();
    var isDrak = false;
    var them=theamcontrollar.isDark;

    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor:them ==true? Colors.grey: LightTheme.BACKGROUNDCOLOR,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //this is nav bar
                Padding(
                  padding: EdgeInsets.only(left: 2.h, top: 2.h, right: 1.h),
                  child: Container(
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30.sp,
                          color:theamcontrollar.isDark==true? Color.fromARGB(255, 240, 172, 1): LightTheme.WIDGETCOLOR.withOpacity(0.3),
                        ),
                        // Container(
                        //   height: 18.h,
                        //   width: 18.w,
                        //   child: Image.asset("asset/images/vl.png"),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),

                        // ),

                        GetBuilder<TheamController>(
                          init: TheamController(),
                          initState: (_) {},
                          builder: (_) {
                            return Switch(
                                value: theamcontrollar.isDark,
                                onChanged: (state) {
                                  print("thisssss isss stateeee $state");
                                  theamcontrollar.changeTheame(state);
                                });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Container(
                      child: Text("this is somthing",
                      style: Theme.of(context).textTheme.displayLarge,)),
                ),
                // this is discover text
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Container(
                      child: AppLargeText(
                    text: "Discover...",
                    color: LightTheme.HEADING2,
                  )),
                ),
                // this is tab bar selector
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(left: 5.w, right: 5.w),
                      labelColor: LightTheme.WIDGETCOLOR,
                      unselectedLabelColor: LightTheme.WIDGETCOLORWITHOPC,
                      indicatorColor: LightTheme.WIDGETCOLORWITHOPC,
                      automaticIndicatorColorAdjustment: true,
                      controller: _tabController,
                      tabs: [
                        Tab(
                            child: AppText(
                          text: "Explore",
                          size: 18.sp,
                          color: LightTheme.SUBHEADING,
                        )),
                        Tab(
                            child: AppText(
                          text: "Beache's",
                          size: 18.sp,
                          color: LightTheme.SUBHEADING,
                        )),
                        Tab(
                            child: AppText(
                          text: "Mountain's",
                          size: 18.sp,
                          color: LightTheme.SUBHEADING,
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 2.w, right: 2.w),
                  height: 40.h,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    Obx(() {
                      return loacationcontrollar.isLoading.isTrue
                          ? shimmercard()
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  loacationcontrollar.locationtList.length,
                              itemBuilder: (_, index) {
                                return loacationcontrollar.isLoading.isTrue
                                    ? shimmercard()
                                    : locationCard(
                                        locationData: loacationcontrollar
                                            .locationtList[index],
                                      );
                              });
                    }),
                    Obx(() {
                      return beachescontrollar.isLoading.value == true
                          ? shimmercard()
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: beachescontrollar.beachesList.length,
                              itemBuilder: (_, index) {
                                return beachescontrollar.isLoading.value == true
                                    ? shimmercard()
                                    : locationCard(
                                        locationData: beachescontrollar
                                            .beachesList[index]);
                              });
                    }),
                    Obx(() {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mountaincontrollar.mountainList.length,
                          itemBuilder: (_, index) {
                            return mountaincontrollar.isLoading.isTrue
                                ? shimmercard()
                                : locationCard(
                                    locationData:
                                        mountaincontrollar.mountainList[index]);
                          });
                    }),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: AppText(
                    text: "Explore More...",
                    size: 22.sp,
                    color: LightTheme.SUBHEADING,
                  ),
                ),
                Container(
                  height: 15.h,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: _data.acticity.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return ExploreIcon(
                          acticity: _data.acticity,
                          index: index,
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Shimmer shimmercard() {
    return Shimmer(
        duration: Duration(seconds: 3), //Default value
        interval: Duration(seconds: 2), //Default value: Duration(seconds: 0)
        color: Color.fromARGB(255, 255, 255, 255), //Default value
        colorOpacity: 0.5, //Default value
        enabled: true, //Default value
        direction: ShimmerDirection.fromLTRB(), //Default Value
        child: Container(
          height: 55.h,
          width: 55.w,
          margin: EdgeInsets.only(right: 2.5.w),
          decoration: BoxDecoration(
            color: Color.fromARGB(167, 214, 213, 208),
            borderRadius: BorderRadius.circular(20),
          ),
        ));
  }
}

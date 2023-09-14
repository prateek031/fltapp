// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/applargetext2.dart';

import '../controller/theamcontroller.dart';
import '../widgets/apptext.dart';

var data = Get.arguments;


class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}
    

class _DetailsPageState extends State<DetailsPage> {


  var data = Get.arguments;
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
  final TheamController theamcontrollar = Get.put(TheamController());
    var them=theamcontrollar.isDark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      print("ticket nav button backed");
                    },
                    icon: Icon(Icons.navigate_before)),
                IconButton(
                    onPressed: () {
                      print("ticket is clicked");
                    },
                    icon: Icon(Icons.confirmation_num)),
              ],
            ),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                  decoration: BoxDecoration(
                      color: them? Colors.grey:LightTheme.BACKGROUNDCOLOR,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: LocationTitle()),
            ),
            floating: false,
            backgroundColor: LightTheme.LOCATIONTEXT,
            expandedHeight: 45.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                data.imgurl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(color:them? Colors.grey:LightTheme.BACKGROUNDCOLOR),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocationTag(),
                      StarWidget(star: data.rating),
                      PeopleHeading(),
                      PeopleSubHeading(),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: PeopleButton(
                                selectedindex: selectedindex, index: index),
                          );
                        }),
                      ),
                      Discription(),
                      DiscriptionPara(),
                       Padding(
        padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 0.h),
        child: ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.w),
            child: Text(
              "Book Your Trip....",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:them? const Color.fromARGB(255, 46, 46, 46): LightTheme.BUTTONBGCOLOR,
            elevation: 10,
            shadowColor: LightTheme.LOCATIONICON,
          ),
        )),
                      SizedBox(
                        height: 3.h,
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LocationTitle extends StatelessWidget {
  const LocationTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeText2(
            text: data.location.toString(),
            color: LightTheme.HEADING3,
          ),
          AppLargeText2(
            text: "${data.price}K",
            color: LightTheme.HEADING3,
          ),
        ],
      ),
    );
  }
}

class LocationTag extends StatelessWidget {
  const LocationTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 2.h,
        left: 1.w,
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: LightTheme.LOCATIONICON),
          Text(
            data.country.toString(),
            style: TextStyle(color:LightTheme.LOCATIONTEXT),
          )
        ],
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
    required this.star,
  });

  final int star;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 1.h,
          left: 1.w,
        ),
        child: Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < star
                      ? LightTheme.STARCOLOR
                      : const Color.fromARGB(220, 192, 144, 13),
                );
              }),
            ),
            SizedBox(
              width: 2.w,
            ),
            AppText(text: "($star.0)", color: LightTheme.SUBHEADING,),
          ],
        ));
  }
}

class PeopleHeading extends StatelessWidget {
  const PeopleHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: AppLargeText2(
        text: "People",
        color: LightTheme.HEADING3,
      ),
    );
  }
}

class PeopleSubHeading extends StatelessWidget {
  const PeopleSubHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w, top: 1.h),
      child: Text("No. of people in your group"),
    );
  }
}

class PeopleButton extends StatelessWidget {
  const PeopleButton({
    super.key,
    required this.selectedindex,
    required this.index,
  });

  final int selectedindex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: selectedindex == index
              ? LightTheme.WIDGETCOLOR
              : LightTheme.SELECTORBGCOLOR,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        (index + 1).toString(),
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: selectedindex != index
              ? LightTheme.TEXTCOLOR
              : LightTheme.TEXTCOLOR2,
        ),
      )),
    );
  }
}

class Discription extends StatelessWidget {
  const Discription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: AppLargeText2(text: "Discription", color: LightTheme.HEADING3),
    );
  }
}

class DiscriptionPara extends StatelessWidget {
  const DiscriptionPara({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      child: AppText(text: data.discription.toString(), color: LightTheme.SUBHEADING,),
    );
  }
}


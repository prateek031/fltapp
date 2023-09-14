// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, non_constant_identifier_names, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/views/detailspage.dart';


class locationCard extends StatelessWidget {
  final locationData;
   locationCard({
    super.key,
      this.locationData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Get.to(DetailsPage(),arguments:locationData,
            transition: Transition.native);
          },
          child: Container(
              height: 55.h,
              width: 55.w,
              margin: EdgeInsets.only(right: 2.5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(locationData?.imgurl??''),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(locationData!.location.toString(),
                          style: GoogleFonts.permanentMarker(
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              color: LightTheme.CARDTEXTCOLOR,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(locationData!.country.toString(),
                        style: GoogleFonts.permanentMarker(
                          textStyle: TextStyle(
                            fontSize: 15.sp,
                            color: LightTheme.CARDTEXTCOLOR,
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

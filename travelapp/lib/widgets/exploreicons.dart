// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/apptext.dart';

class ExploreIcon extends StatelessWidget {
  const ExploreIcon({
    super.key,
    required this.acticity,
    required this.index,
  });
final Map acticity;
final int index;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Container(
        height: 20.h,
        width: 30.w,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.h,
                width: 25.w,
                child: Image.asset("asset/images/${acticity.keys.elementAt(index)}"),
              )
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 25.w,
                child: Center(child:AppText(text: "${acticity.values.elementAt(index)}", color: LightTheme.SUBHEADING)),
              )
            ],
          )
        ]),
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/services/routes/routes.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 15.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 28, 41, 51),
          ),
          child: Center(
            child:
                Text("YOUR LOGO", style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.list_alt_outlined,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("My Orders",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.data_object,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("My Loyalty Points",
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.content_paste_search,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("Lucky Draw Contest",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("My Profile",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.contact_page,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("Report & Contact Us",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.store,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("Locate Store",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
             SharedPreferences prefs = await SharedPreferences.getInstance();
             print(prefs.get('token'));
            prefs.remove('token');
            Get.offAllNamed(Routes.LogInPage);
            
          },
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 7.h,
              width: 80.w,
              color: Color.fromARGB(179, 214, 214, 214),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Container(
                      height: 7.h,
                      width: 14.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.logout,
                        size: 40.sp,
                        color: Color.fromARGB(179, 167, 164, 164),
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 60.w,
                    child: Row(
                      children: [
                        Text("Log Out",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

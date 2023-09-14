// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/services/routes/routes.dart';

class ProductTile extends StatelessWidget {
  final controller;

  const ProductTile({
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.ProductDetailsPage);
      },
      child: Container(
                    height: 17.h,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(176, 218, 216, 216),
                    child: Padding(
      padding:  EdgeInsets.all(1.h),
      child: Row(
        children: [
          Container(
            height: 15.h,
            width: 12.h,
             
           child: Image.asset("asset/images/product_img.png",
           fit: BoxFit.cover,),
          ),
          Container(
            height: 15.h,
            width: 31.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("${controller.printName}",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),)
                  ],
                ),
                  Row(
                  children: [
                    Text("SNACKS",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),)
                  ],
                ),
                  Row(
                  children: [
                    Text("data")
                  ],
                ),
                  Row(
                  children: [
                    Text("Our Price:12.75",style: TextStyle(
                      fontSize: 14.sp,
                    ),
                    ),
                    SizedBox(width: 3.w,),
                    Container(height: 4.h,
                    width: 28.w,
                    child: Row(
                      children: [
                        Container(
                          height: 4.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                             child: Image(image: AssetImage("asset/images/minus.png"))
                        ),
                          Container(
                          height: 4.h,
                          width: 11.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Text("10")),
                        ),
                          Container(
                          height: 4.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image(image: AssetImage("asset/images/plus.png"))
                         
                        ),
                      ],
                    ),)
                  ],
                ),
              ],
            ),
          ),
                
        ],
      ),
                    ),
                  ),
    );
  }
}

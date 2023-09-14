// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("key"),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        return null;
      },
      child: Padding(
        padding: EdgeInsets.only(left: 1.h,right: 1.h,top: 1.h),
        child: Container(
          height: 17.h,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(176, 218, 216, 216),
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              children: [
                Container(
                  height: 15.h,
                  width: 10.h,
                  child: Image.asset(
                    "asset/images/product_img.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 0.5.w,),
                Container(
                  height: 15.h,
                  width: 32.5.h,
                  // color: Colors.amberAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Maggie Noodles - Small(100gm)",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "SNACKS",
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                          ),
                          Text("data")
                        ],
                      ),
                      Divider(
                        thickness: 1.sp,
                        height: 0.2.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: 28.w,
                            child: Row(
                              children: [
                                Container(
                                    height: 4.h,
                                    width: 8.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image(
                                        image:
                                            AssetImage("asset/images/minus.png"))),
                                Container(
                                  height: 4.h,
                                  width: 10.w,
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
                                    child: Image(
                                        image:
                                            AssetImage("asset/images/plus.png"))),
                              ],
                            ),
                          ),
          
                          Text(
                            "X 12.75=",
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            " 100.00",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

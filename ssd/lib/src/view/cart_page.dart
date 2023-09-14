// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/src/getx/controllers/get_cart_products_controller.dart';
import 'package:ssd/src/widgets/cart_product_tile.dart';
import 'package:ssd/src/widgets/search.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GetCartController getCartController =Get.put(GetCartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: ListView(
          children: [
            Search(),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.navigate_before)),
                      Text(
                        "My Cart",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                Icon(Icons.location_on_outlined),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 10.h,
              color: Color.fromARGB(255, 243, 229, 104),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
                child: Text(
                    "Add the items  of at least rupees 175 more to get free Delivery"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Items:-5"),
                TextButton(onPressed: () {}, child: Text("Clear Cart"))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (_, index) {
                    return CartProductTile();
                  }),
            ),
            Container(
              height: 18.h,
              child: Column(
                children: [
                  Divider(
                    thickness: 2.sp,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total Bill Amount"), Text("845.25")],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text("Proceed to Check Out"),
                        Icon(Icons.navigate_next_outlined)
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 74, 24, 190)),
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size(90.w, 6.5.h)), // Width and height
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

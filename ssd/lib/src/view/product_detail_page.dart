// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/services/routes/routes.dart';
import 'package:ssd/src/widgets/search.dart';

import '../getx/controllers/add_to_cart_controller.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final AddToCartCartController cartController =
      Get.put(AddToCartCartController());
  var ind = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Search(),
                Divider(
                  thickness: 1.sp,
                  color: Colors.grey,
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
                            Get.arguments.printName.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.CartPage);
                        },
                        icon: Icon(Icons.shopping_bag_outlined))
                  ],
                ),
                Divider(
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
                CarouselSlider(
                  options: CarouselOptions(enableInfiniteScroll: false),
                  items: [1, 2, 3, 4, 5].map((index) {
                    return Builder(
                      builder: (
                        BuildContext context,
                      ) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "asset/images/product_img_details.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ));
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  Get.arguments.printName.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  "SNACKS",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Divider(
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
                Container(
                  height: 9.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("MRP:-"),
                              Text(
                                "${Get.arguments.customerInventories!.transaction.purchaseData.mrp.toString()}",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor:
                                        Color.fromARGB(255, 196, 31, 31),
                                    decorationThickness: 3.sp),
                              ),
                            ],
                          ),
                          Text(
                              "Our Price:-${Get.arguments.customerInventories!.transaction.purchaseData.sellingPrice.toString()}"),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 40.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 4.h,
                              width: 8.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image(
                                  image: AssetImage("asset/images/minus.png"))),
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
                              child: Image(
                                  image: AssetImage("asset/images/plus.png"))),
                        ],
                      ),
                    )
                  ]),
                ),
                Divider(
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
                Text(
                  "Product Discription",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  Get.arguments.description.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Free Item/Gift with the product ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "No-No Gift | Quantity:00",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Discount on Quantity",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        Get.arguments.customerInventories!.transaction
                            .purchaseData.productSlab.length, (index) {
                      return Text(
                        "Buy min ${Get.arguments.customerInventories!.transaction.purchaseData.productSlab[index].slabMinValue} ${(Get.arguments.customerInventories!.transaction.purchaseData.productSlab[index].slabMaxValue) == 0 ? "or" : "to"} ${(Get.arguments.customerInventories!.transaction.purchaseData.productSlab[index].slabMaxValue) == 0 ? "above" : (Get.arguments.customerInventories!.transaction.purchaseData.productSlab[index].slabMaxValue)} and get each product in  ${Get.arguments.customerInventories!.transaction.purchaseData.productSlab[index].sellingPrice}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      );
                    })),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
                ElevatedButton(
                  onPressed: () {
                    cartController.addToCart(
                      token:'hWVqhMrErovDpNBxxab2yCb3hVf7N8QKN698GCujXs3tbdRfjB',
                      inventoryId:Get.arguments.customerInventories!.transaction.inventoryId.toString() ,
                      price: Get.arguments.customerInventories!.transaction.purchaseData.mrp.toString(),
                      unitPrice: Get.arguments.customerInventories!.transaction.purchaseData.sellingPrice.toString(),
                      quantity: "1",
                      quantityCount: "1",  
                      pricableQuantity: "1",
                       unitQuantity: '5',

                      );   

                                         
                          // print(Get.arguments.customerInventories!.transaction.inventoryId);
                          // print(Get.arguments.customerInventories!.transaction.purchaseData.sellingPrice);
                          // print(Get.arguments.customerInventories!.transaction.purchaseData.mrp);
                          print(Get.arguments.customerInventories!.transaction.purchaseData.mrp);



                          },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add this item to Cart"),
                      Icon(Icons.navigate_next_outlined)
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 74, 24, 190)),
                    fixedSize:
                        MaterialStateProperty.all<Size>(Size(90.w, 6.5.h)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

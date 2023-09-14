// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_final_fields, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/src/widgets/search.dart';
import '../../services/routes/routes.dart';
import '../getx/controllers/category_product_controller.dart';
import '../widgets/shimmer_loader.dart';

class SpecificCategoryPage extends StatefulWidget {
  const SpecificCategoryPage({super.key});

  @override
  State<SpecificCategoryPage> createState() => _SpecificCategoryPageState();
}

class _SpecificCategoryPageState extends State<SpecificCategoryPage> {
  CategoryProductController categoryProductController =Get.put(CategoryProductController());
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Search(),
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
                      child: Icon(Icons.navigate_before),
                    ),
                    Text(
                      "${Get.arguments.name}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
          Container(
              height: 600,
              child: Obx(
                () => categoryProductController.isLoading.value
                    ? Center(
                        child: shimmerloader(),
                        
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount:
                            categoryProductController.categoryproducts.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ProductDetailsPage,
                                    arguments: categoryProductController
                                        .categoryproducts[index]);
                              },
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
                                        width: 12.h,
                                        child: Image.asset(
                                          "asset/images/product_img.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        height: 15.h,
                                        width: 31.h,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${categoryProductController.categoryproducts[index].printName}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "SNACKS",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                            Text("data"),
                                            Row(
                                              children: [
                                                Text(
                                                  "Our Price:12.75",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Container(
                                                  height: 4.h,
                                                  width: 28.w,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          height: 4.h,
                                                          width: 8.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Image(
                                                              image: AssetImage(
                                                                  "asset/images/minus.png"))),
                                                      Container(
                                                        height: 4.h,
                                                        width: 11.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Text("10")),
                                                      ),
                                                      Container(
                                                          height: 4.h,
                                                          width: 8.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Image(
                                                              image: AssetImage(
                                                                  "asset/images/plus.png"))),
                                                    ],
                                                  ),
                                                )
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
                        }),
              ))
        ],
      ),
    ));
  }
}

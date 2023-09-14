// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/src/getx/controllers/view_all_products_controller.dart';
import 'package:ssd/src/view/home_page.dart';
import 'package:ssd/src/widgets/search.dart';
import 'package:ssd/src/widgets/shimmer_loader.dart';

import '../../services/routes/routes.dart';
// import '../widgets/product_tile.dart';

class FeaturedProductsPage extends StatefulWidget {
  const FeaturedProductsPage({super.key});

  @override
  State<FeaturedProductsPage> createState() => _FeaturedProductsPageState();
}

class _FeaturedProductsPageState extends State<FeaturedProductsPage> {
  ProductController productController = Get.put(ProductController());
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(loadMoreData);
  }

  void loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      productController.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 1.h, top: 1.5.h, right: 1.h),
          child: Column(
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
                            Get.offAll(HomePage());
                          },
                          child: Icon(Icons.navigate_before),
                        ),
                        Text(
                          "Featured Produts",
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
                child:Obx(() =>productController.isLoading.value
                    ? Center(
                        child: shimmerloader(),
                      ):ListView.builder(
                    controller: _scrollController,
                    itemCount: productController.products.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ProductDetailsPage,
                                arguments: productController.products[index]);
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
                                          "${productController.products[index].printName}",
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
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Image(
                                                          image: AssetImage(
                                                              "asset/images/minus.png"))),
                                                  Container(
                                                    height: 4.h,
                                                    width: 11.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                        child: Text("10")),
                                                  ),
                                                  Container(
                                                      height: 4.h,
                                                      width: 8.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
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
                    }),) 
              )
            ],
          ),
        ),
      ),
    );
  }
}

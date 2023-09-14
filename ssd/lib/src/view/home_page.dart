// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/services/routes/routes.dart';
import 'package:ssd/src/getx/controllers/categories_controller.dart';
import 'package:ssd/src/widgets/search.dart';

import '../getx/controllers/counter_controler.dart';
import '../getx/controllers/view_all_products_controller.dart';
import '../widgets/end_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CounterController counterController = Get.put(CounterController());
  ProductController productController = Get.put(ProductController());
  CategoryController categoryController = Get.put(CategoryController());

@override
  void dispose() {
    productController.products;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: drawer(),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(1.h, 1.h, 1.h, 0.h),
              child: Search(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Container(
                height: 7.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Container(
                              width: 55.w,
                              height: 4.h,
                              child: Center(
                                child: Text(
                                  "this is address feild it can  ",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 25.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.notifications_none_outlined),
                            InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.CartPage);
                                },
                                child: Icon(Icons.shopping_bag_outlined)),
                            InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState?.openEndDrawer();
                                },
                                child: Icon(Icons.list_sharp)),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 23.h,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                      child: Image.asset(
                        "asset/images/promo_banner.png",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.CategoriesPage);
                        },
                        child: Text("View All"))
                  ],
                ),
              ),
            ),
            
            Obx(
               () {
                return categoryController.categories.isEmpty ? SizedBox():
                 Container(
                  height: 15.h,
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                      children: List.generate(categoryController.categories.length > 6?6 : categoryController.categories.length  , (index) {
                    return Padding(
                      padding: EdgeInsets.all(0.6.h),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(Routes.CategoriesPage);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 100, 177, 240),
                          ),
                          height: 6.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.2.h, horizontal: 1.5.h),
                            child: Text(
                                  "${categoryController.categories[index].name}",
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                          ),
                        ),
                      ),
                    );
                  })),
                );
              }
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Product",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.FeaturedProductsPage);
              
                        },
                        child: Text(
                          "View All",
                        ))
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Obx(() => productController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: List.generate(productController.products.length,
                          (index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ProductDetailsPage,
                              arguments: productController.products[index]);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 1.h, left: 1.h, right: 1.h),
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
                                          productController
                                              .products[index].printName,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        Text(
                                          "SNACKS",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        Text(
                                          "${productController.products[index].customerInventories!.transaction.purchaseData.mrp}",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Color.fromARGB(
                                                  255, 196, 31, 31),
                                              decorationThickness: 3.sp),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                "${productController.products[index].customerInventories!.transaction.purchaseData.sellingPrice}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(fontSize: 14.sp)),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Container(
                                              height: 4.h,
                                              width: 28.w,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      counterController
                                                          .decrement(index);
                                                    },
                                                    child: Container(
                                                        height: 4.h,
                                                        width: 8.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Image(
                                                            image: AssetImage(
                                                                "asset/images/minus.png"))),
                                                  ),
                                                  Container(
                                                    height: 4.h,
                                                    width: 11.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                      child: Obx(
                                                        () => Text(
                                                            "${counterController.counters[index].value}"),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      counterController
                                                          .increment(index);
                                                    },
                                                    child: Container(
                                                      height: 4.h,
                                                      width: 8.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Image(
                                                        image: AssetImage(
                                                            "asset/images/plus.png"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                    }))),
            ),
          ],
        ),
      ),
    );
  }
}

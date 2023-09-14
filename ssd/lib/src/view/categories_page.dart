// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/services/routes/routes.dart';
import 'package:ssd/src/getx/controllers/categories_controller.dart';
import 'package:ssd/src/getx/controllers/category_product_controller.dart';

import '../widgets/search.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoryController categoryController = Get.put(CategoryController());
  CategoryProductController categoryProductController = Get.put(CategoryProductController());

  @override
  Widget build(BuildContext context) {
    print(categoryController.categories.length);
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
                              Get.offNamed(Routes.HomePage);
                            },
                            child: Icon(Icons.navigate_before)),
                        Text(
                          "Categories",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.CartPage);
                      }, icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              Expanded(
                child: ListView(
                  physics:BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Obx(() => categoryController.isLoading.value ? Center(child: CircularProgressIndicator(),): Wrap(
                          children: List.generate(
                            categoryController.categories.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.all(0.6.h),
                                child: InkWell(
                                  onTap: ()async{
                                    print("tapped ${categoryController.categories[index].id}");
                                    await categoryProductController.fetchProducts(category: categoryController.categories[index].id);
                                    Get.toNamed(Routes.SpecificCategoryPage,arguments: categoryController.categories[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color.fromARGB(255, 100, 177, 240),
                                    ),
                                    height: 6.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 1.5.h),
                                      child: Text(
                                        categoryController.categories[index].name.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/src/getx/controllers/view_all_products_controller.dart';
import 'package:ssd/src/widgets/search_product_feild.dart';

import '../widgets/product_tile.dart';

class SearchProductsPage extends StatefulWidget {
  const SearchProductsPage({super.key});

  @override
  State<SearchProductsPage> createState() => _SearchProductsPageState();
}

class _SearchProductsPageState extends State<SearchProductsPage> {
  ProductController productController= Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 1.h, top: 1.5.h, right: 1.h),
          child: Column(
            children: [
              SearchProductFeild(),
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
                          "Search Result",
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
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: ProductTile(controller:productController,),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

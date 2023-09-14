// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssd/services/routes/routes.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.SearchProductsPage);
      },
      child: TextField(
          enabled: false,
        decoration: InputDecoration(
          hintText: 'Search Products',
          hintStyle:
              TextStyle(color: Colors.grey),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey, 
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none, 
            borderRadius:
                BorderRadius.circular(10.0), 
          ),
          filled: true,
          fillColor: Colors.grey[200], 
        ),
        style: TextStyle(color: Colors.grey), 
      ),
    );
  }
}
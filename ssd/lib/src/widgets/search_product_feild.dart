// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchProductFeild extends StatelessWidget {
  const SearchProductFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Products',
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      style: TextStyle(color: Colors.grey),
    );
  }
}

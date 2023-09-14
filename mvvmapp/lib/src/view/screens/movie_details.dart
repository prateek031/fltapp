// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmapp/core/theme/colours.dart';
import 'package:sizer/sizer.dart';

var data = Get.arguments;

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  var imgPath = 'http://image.tmdb.org/t/p/w500';
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                  print("ticket nav button backed");
                },
                icon: Icon(Icons.navigate_before),color: PRIMARYCOLOR,),
            IconButton(
                onPressed: () {
                  print("ticket is clicked");
                },
                icon: Icon(Icons.confirmation_num),color: PRIMARYCOLOR,),
          ],
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: Container(
              decoration: BoxDecoration(
                color: PRIMARYCOLOR,
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: ThemeData().appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.h),
                        child: Text("${data['original_title']}",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium),
                      )),
                ],
              )),
        ),
        floating: false,
        expandedHeight: 45.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            "http://image.tmdb.org/t/p/w500${data['poster_path']}",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      SliverToBoxAdapter(
          child: Container(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title :- ${data['original_title']}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text("Language :- ${data['original_language']}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 0.5.h,
            ),
            Text("OverView :- ${data['overview']}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 0.5.h,
            ),
            Text("Avrege Votes :- ${data['vote_average']}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 0.5.h,
            ),
            Text("Vote Count :- ${data['vote_count']}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 0.5.h,
            ),
            Text("Popularity :- ${data['popularity']}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 0.5.h,
            ),
            Text("18+ :- ${data['adult']}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 0.5.h,
            ),
            Text("18+ :- ${data['release_date']}",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      )))
    ]));
  }
}

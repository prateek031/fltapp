// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mvvmapp/core/utils/helper.dart';
import 'package:mvvmapp/src/view/widget/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:mvvmapp/src/controller/theme_controller.dart';
import '../../../services/api/movie_remote_services.dart';
import '../../controller/network_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoviesController moviesController= Get.find();
  TheamController theamControllar = Get.find();
  NetworkController networkController = Get.find();

  @override
  void initState() {
    HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watch now",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Obx(
                  () => Switch(
                    value: theamControllar.isDark.value,
                    onChanged: (state) {
                      theamControllar.isDark.toggle();
                      state
                          ? Get.changeThemeMode(ThemeMode.dark)
                          : Get.changeThemeMode(ThemeMode.light);
                    },
                  ),
                ),
              ],
            ),

            // tags

            Container(
              width: MediaQuery.of(context).size.width,
              height: 5.5.h,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Helper().tostMessage(
                            "the button which contain index no ${index + 1} is tapped ");
                      },
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 42.w,
                        child: Center(
                            child: Text(
                          "Data$index",
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),
                      ),
                    );
                  }),
            ),
            //title
            SizedBox(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: Text(
                  "Movies",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Expanded(child: Obx(() {
              if (networkController.connectiontype.value == true) {
                return Obx(() => AlignedGridView.count(
                    itemCount: moviesController.movies.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemBuilder: (context, index) {
                      final moviedata = moviesController.movies[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed("/details",arguments: moviedata);
                        },
                        child: Container(
                          color: Color.fromARGB(134, 231, 230,
                              224), // make a var of this color in color file
                          height: 230,

                          child: moviesController.isLoading.value
                              ? shimmerloader()
                              : Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(0.2.h),
                                            height: 14.5.h,
                                            child: Image(
                                              image: NetworkImage(
                                                  "http://image.tmdb.org/t/p/w500${moviedata['poster_path']}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(0.3.h),
                                        color: Colors.amberAccent,
                                        width: 100.w,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 46.w,
                                                    child: Text(
                                                      moviedata['title'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  color: Colors.blue,
                                                  width: 46.w,
                                                  height: 10.h,
                                                  child: Text(
                                                    "Release Date:-${moviedata['release_date']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      );
                    }));
              } else {
                return Container(
                  child: Center(
                    child: Text(" Check your internet connection"),
                  ),
                );
              }
            })),
          ],
        ),
      ),
    ));
  }
}

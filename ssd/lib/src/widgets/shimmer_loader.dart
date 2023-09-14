// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

Shimmer shimmerloader() {
  return Shimmer(
    duration: Duration(seconds: 3),
    interval: Duration(seconds: 2),
    color: Color.fromARGB(166, 218, 186, 9),
    colorOpacity: 0.5,
    enabled: true,
    direction: ShimmerDirection.fromLTRB(),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(171, 234, 238, 234),
      ),
    ),
  );
}

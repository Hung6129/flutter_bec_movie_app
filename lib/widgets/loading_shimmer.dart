import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        // viewportFraction: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index, realIdx) {
        return Shimmer.fromColors(
          baseColor: (Colors.grey[300])!,
          highlightColor: (Colors.grey[100])!,
          child: Container(
            color: Colors.white,
            // width: 150,
          ),
        );
      },
    );
  }
}

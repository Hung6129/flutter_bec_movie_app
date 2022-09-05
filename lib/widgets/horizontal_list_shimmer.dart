import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListHorizontal extends StatelessWidget {
  const ShimmerListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Shimmer.fromColors(
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              baseColor: (Colors.grey[300])!,
              highlightColor: (Colors.grey[100])!,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetailPage extends StatelessWidget {
  const LoadingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(slivers: [
      SliverAppBar(
        // leading: Icon(Icons.home),
        // automaticallyImplyLeading: false,
        toolbarHeight: maxHeight / (maxHeight / 50),
        expandedHeight: maxHeight / (maxHeight / 250),
        flexibleSpace: FlexibleSpaceBar(
          background: Shimmer.fromColors(
            baseColor: (Colors.grey[300])!,
            highlightColor: (Colors.grey[100])!,
            child: Container(
              color: Colors.white,
              height: maxHeight / (maxHeight / 250),
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            /// Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: (Colors.grey[300])!,
                highlightColor: (Colors.grey[100])!,
                child: Container(
                  color: Colors.white,
                  height: maxHeight / (maxHeight / 50),
                ),
              ),
            ),

            /// Poster and play trailer
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  /// Poster
                  Shimmer.fromColors(
                    baseColor: (Colors.grey[300])!,
                    highlightColor: (Colors.grey[100])!,
                    child: Container(
                      color: Colors.white,
                      height: maxHeight / (maxHeight / 250),
                    ),
                  ),
                  SizedBox(
                    width: maxWidth / (maxWidth / 10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: (Colors.grey[300])!,
                          highlightColor: (Colors.grey[100])!,
                          child: Container(
                            color: Colors.white,
                            height: maxHeight / (maxHeight / 50),
                          ),
                        ),
                        SizedBox(
                          height: maxHeight / (maxHeight / 10),
                        ),
                        Shimmer.fromColors(
                          baseColor: (Colors.grey[300])!,
                          highlightColor: (Colors.grey[100])!,
                          child: Container(
                            color: Colors.white,
                            height: maxHeight / (maxHeight / 50),
                          ),
                        ),
                        SizedBox(
                          height: maxHeight / (maxHeight / 5),
                        ),
                        Shimmer.fromColors(
                          baseColor: (Colors.grey[300])!,
                          highlightColor: (Colors.grey[100])!,
                          child: Container(
                            color: Colors.white,
                            height: maxHeight / (maxHeight / 50),
                          ),
                        ),
                        SizedBox(
                          height: maxHeight / (maxHeight / 10),
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: (Colors.grey[300])!,
                              highlightColor: (Colors.grey[100])!,
                              child: Container(
                                color: Colors.white,
                                height: maxHeight / (maxHeight / 40),
                                width: maxWidth / (maxWidth / 90),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: (Colors.grey[300])!,
                              highlightColor: (Colors.grey[100])!,
                              child: Container(
                                color: Colors.white,
                                height: maxHeight / (maxHeight / 40),
                                width: maxWidth / (maxWidth / 90),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

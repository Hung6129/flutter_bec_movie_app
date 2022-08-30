import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'constrant.dart';

class CustomCard extends StatelessWidget {
  final String profileUrl;
  final String title;
  final String subTitle;

  const CustomCard(
      {Key? key,
      required this.profileUrl,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _maxHeight = MediaQuery.of(context).size.height;
    double _maxWidth = MediaQuery.of(context).size.width;
    return Card(
      color: Constrant.p4,
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: _maxHeight / (_maxHeight / 200),
          width: _maxWidth / (_maxWidth / 150),
          child: Column(
            children: [
              CachedNetworkImage(
                height: _maxHeight / (_maxHeight / 180),
                width: _maxWidth / (_maxWidth / 160),
                fit: BoxFit.cover,
                imageUrl: "https://image.tmdb.org/t/p/original/${profileUrl}",
                placeholder: (ctx, url) => Shimmer.fromColors(
                  baseColor: (Colors.grey[300])!,
                  highlightColor: (Colors.grey[100])!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) {
                  return Container(
                    width: _maxHeight / (_maxHeight / 120),
                    color: Constrant.p6,
                    child: Image.asset("assets/not_found_images.png"),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Constrant.p3,
                        fontWeight: FontWeight.bold,
                        fontSize: _maxHeight / (_maxHeight / 12),
                      ),
                    ),
                    Text(
                      subTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Constrant.p2,
                        fontWeight: FontWeight.bold,
                        fontSize: _maxHeight / (_maxHeight / 9),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

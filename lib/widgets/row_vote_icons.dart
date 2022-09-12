import 'package:flutter/material.dart';

import '../config/palettes.dart';

class RowVoteIcons extends StatelessWidget {
  final double popularity;
  final double voteAverage;
  final int voteCount;
  const RowVoteIcons(
      {Key? key,
      required this.popularity,
      required this.voteAverage,
      required this.voteCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    double x = voteAverage;
    double num = x / 2;
    String finalVoteAverage = num.toStringAsFixed(1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/vote_count_icon.png",
              height: maxHeight / (maxHeight / 35),
              width: maxWidth / (maxWidth / 35),
            ),
            Text(
              voteCount.toString(),
              style: Palettes.kHeading6,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/user_score_icon.png",
              height: maxHeight / (maxHeight / 35),
              width: maxWidth / (maxWidth / 35),
            ),
            Text(
              popularity.toStringAsFixed(0),
              style: Palettes.kHeading6,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/popularity_icon.png",
              height: maxHeight / (maxHeight / 35),
              width: maxWidth / (maxWidth / 35),
            ),
            Text(finalVoteAverage.toString() + "/5", style: Palettes.kHeading6),
          ],
        )
      ],
    );
  }
}

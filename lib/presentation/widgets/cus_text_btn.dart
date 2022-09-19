import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/data_layer/model/movie_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/palettes.dart';
import '../../repository/persist_data/progress_data.dart';

class CustomTextButton extends StatelessWidget {
  final String url;
  const CustomTextButton({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            final youtubeUrl = 'https://www.youtube.com/embed/$url';
            if (await canLaunchUrl(Uri.parse(youtubeUrl))) {
              await launchUrl(Uri.parse(youtubeUrl));
            }
          },
          child: Container(
            height: maxHeight / (maxHeight / 40),
            width: maxWidth / (maxWidth / 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Palettes.p3,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.play_arrow,
                  size: 28,
                  color: Palettes.textWhite,
                ),
                Text(
                  "Play Trailer",
                  style: Palettes.kHeading8,
                )
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // PersitsData().addToFavoriteList(movieDetail);
            // print(movieDetail);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Palettes.p2,
            ),
            height: maxHeight / (maxHeight / 40),
            width: maxWidth / (maxWidth / 250),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  size: 28,
                  color: Palettes.p3,
                ),
                Text(
                  "Add to favorite list",
                  style: Palettes.kHeading8,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

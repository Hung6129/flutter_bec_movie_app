import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/screens/detailpage/tv_show_detail_page.dart';
import 'package:shimmer/shimmer.dart';

import '../config/palettes.dart';
import '../screens/detailpage/movie_detail_page.dart';

class HorizontalItems extends StatelessWidget {
  final List? list;
  final bool? isTVShow;
  const HorizontalItems({
    Key? key,
    this.list,
    this.isTVShow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: list!.length,
        itemBuilder: (context, index) {
          final movie = list![index];
          return Container(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () => isTVShow == false
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movie),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TVShowDetailPage(tvShowModel: movie),
                      ),
                    ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: CachedNetworkImage(
                  width: 120.0,
                  fit: BoxFit.cover,
                  // imageUrl: Urls.imageUrl(movie.posterPath!),
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                  placeholder: (context, url) => Shimmer.fromColors(
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
                  errorWidget: (context, url, error) => Container(
                    color: Palettes.p3,
                    height: 170.0,
                    width: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Palettes.textWhite,
                        ),
                        Text(
                          "No data",
                          style: Palettes.bodyText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

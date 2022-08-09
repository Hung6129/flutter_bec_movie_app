import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/screens/detailpage/cast_detail_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../../bloc/movie_detail_bloc/movie_detail_event.dart';
import '../../model/movie_cast.dart';
import '../../model/movie_detail_model.dart';
import '../../model/movie_model.dart';
import '../../widgets/app_text.dart';
import '../../widgets/constrant.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailBloc()..add(MovieDetailEventStated(movie.id!)),
      child: WillPopScope(
        child: Scaffold(
          body: _buildDetailBody(context),
        ),
        onWillPop: () async => true,
      ),
    );
  }

  Widget _buildDetailBody(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        double maxHeight = MediaQuery.of(context).size.height;
        double maxWidth = MediaQuery.of(context).size.width;
        if (state is MovieDetailLoading) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: maxHeight / (maxHeight / 50),
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(
                //     20,
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       ),
                //     ),
                //     padding: EdgeInsets.only(top: 5, bottom: 10),

                //     width: double.maxFinite,
                //   ),
                // ),
                pinned: true,
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
              ),
            ],
          );
        } else if (state is MovieDetailLoaded) {
          MovieDetail movieDetail = state.detail;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: maxHeight / (maxHeight / 50),
                backgroundColor: Constrant.p3,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Platform.isIOS
                          ? Icon(Icons.arrow_back_ios)
                          : Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(
                //     20,
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       ),
                //     ),
                //     padding: EdgeInsets.only(top: 5, bottom: 10),

                //     width: double.maxFinite,
                //   ),
                // ),
                pinned: true,
                expandedHeight: maxHeight / (maxHeight / 250),
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: (Colors.grey[300])!,
                      highlightColor: (Colors.grey[100])!,
                      child: Container(
                        color: Colors.white,
                        height: maxHeight / (maxHeight / 250),
                      ),
                    ),
                    // errorWidget: (context, url, error) => Container(
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage('assets/images/img_not_found.jpg'),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    /// Title
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movieDetail.originalTitle!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Constrant.p3,
                            fontSize: maxHeight / (maxHeight / 25)),
                      ),
                    ),

                    /// Poster and play trailer
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          /// Poster
                          CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${movieDetail.poster_path}',
                            width: maxWidth / (maxWidth / 120),
                            height: maxHeight / (maxHeight / 180),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: (Colors.grey[300])!,
                              highlightColor: (Colors.grey[100])!,
                              child: Container(
                                color: Colors.white,
                                height: maxHeight / (maxHeight / 250),
                              ),
                            ),
                            // errorWidget: (context, url, error) => Container(
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //       image: AssetImage('assets/images/img_not_found.jpg'),
                            //     ),
                            //   ),
                            // ),
                          ),
                          SizedBox(
                            width: maxWidth / (maxWidth / 10),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieDetail.tagline!,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Constrant.p2,
                                      fontSize: maxHeight / (maxHeight / 18)),
                                ),
                                SizedBox(
                                  height: maxHeight / (maxHeight / 20),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Release Date: ',
                                    style: TextStyle(
                                        fontSize: maxHeight / (maxHeight / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Constrant.p3),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: movieDetail.releaseDate,
                                        style: TextStyle(
                                            fontSize:
                                                maxHeight / (maxHeight / 15),
                                            fontWeight: FontWeight.bold,
                                            color: Constrant.textBlack),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: maxHeight / (maxHeight / 5),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Run Time: ',
                                    style: TextStyle(
                                        fontSize: maxHeight / (maxHeight / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Constrant.p3),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${movieDetail.runtime}m",
                                        style: TextStyle(
                                            fontSize:
                                                maxHeight / (maxHeight / 15),
                                            fontWeight: FontWeight.bold,
                                            color: Constrant.textBlack),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: maxHeight / (maxHeight / 10),
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        final youtubeUrl =
                                            'https://www.youtube.com/embed/${movieDetail.trailerId}';
                                        if (await canLaunch(youtubeUrl)) {
                                          await launch(youtubeUrl);
                                        }
                                      },
                                      child: Container(
                                        color: Constrant.p3,
                                        height: maxHeight / (maxHeight / 40),
                                        width: maxWidth / (maxWidth / 90),
                                        child: Center(
                                            child: AppText(
                                          text: "Play Trailer",
                                          color: Constrant.textWhite,
                                          size: maxHeight / (maxHeight / 15),
                                        )),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        color: Constrant.p6,
                                        height: maxHeight / (maxHeight / 40),
                                        width: maxWidth / (maxWidth / 90),
                                        child: Center(
                                            child: AppText(
                                          text: "Rate It !!!",
                                          color: Constrant.p3,
                                          size: maxHeight / (maxHeight / 15),
                                        )),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/vote_count_icon.png",
                              height: maxHeight / (maxHeight / 40),
                              width: maxWidth / (maxWidth / 40),
                            ),
                            Text(
                              movieDetail.voteCount!,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Constrant.p2,
                                  fontSize: maxHeight / (maxHeight / 18)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/user_score_icon.png",
                              height: maxHeight / (maxHeight / 40),
                              width: maxWidth / (maxWidth / 40),
                            ),
                            Text(
                              movieDetail.voteAverage!,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Constrant.p2,
                                  fontSize: maxHeight / (maxHeight / 18)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/popularity_icon.png",
                              height: maxHeight / (maxHeight / 40),
                              width: maxWidth / (maxWidth / 40),
                            ),
                            Text(
                              movieDetail.popularity!,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Constrant.p2,
                                  fontSize: maxHeight / (maxHeight / 18)),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: maxHeight / (maxHeight / 10),
                    ),

                    /// Overview
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Overview",
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Constrant.p3,
                                fontWeight: FontWeight.bold,
                                fontSize: maxHeight / (maxHeight / 20)),
                          ),
                          Text(
                            movieDetail.overview!,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Constrant.textBlack,
                                fontSize: maxHeight / (maxHeight / 15)),
                          ),
                        ],
                      ),
                    ),

                    /// Cast list
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Top Billed Cast",
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Constrant.p3,
                                fontWeight: FontWeight.bold,
                                fontSize: maxHeight / (maxHeight / 20)),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: maxHeight / (maxHeight / 250),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movieDetail.castList.length,
                              itemBuilder: (context, index) {
                                MovieCast cast = movieDetail.castList[index];
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CastDetailPage(),
                                    ),
                                  ),
                                  child: Card(
                                      elevation: 1.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: maxHeight / (maxHeight / 200),
                                          width: maxWidth / (maxWidth / 120),
                                          child: Column(
                                            children: [
                                              CachedNetworkImage(
                                                height: maxHeight /
                                                    (maxHeight / 150),
                                                width:
                                                    maxWidth / (maxWidth / 120),
                                                imageUrl:
                                                    "https://image.tmdb.org/t/p/original/${cast.profilePath}",
                                                placeholder: (ctx, url) =>
                                                    Shimmer.fromColors(
                                                  baseColor:
                                                      (Colors.grey[300])!,
                                                  highlightColor:
                                                      (Colors.grey[100])!,
                                                  child: Container(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) {
                                                  return Container(
                                                    width: maxHeight /
                                                        (maxHeight / 120),
                                                    color: Constrant.p6,
                                                    child: Image.asset(
                                                        "assets/not_found_images.png"),
                                                  );
                                                },
                                              ),
                                              Text(
                                                cast.name!,
                                                textAlign: TextAlign.center,
                                                // overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Constrant.p3,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: maxHeight /
                                                      (maxHeight / 15),
                                                ),
                                              ),
                                              Text(
                                                cast.character!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color: Constrant.p2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: maxHeight /
                                                      (maxHeight / 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: maxHeight / (maxHeight / 60),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is MovieDetailError) {
          return Center(
            child: AppText(
              text: state.error,
              color: Colors.black,
            ),
          );
        } else {
          return Container(
            color: Colors.red,
            height: 100,
            width: 100,
          );
        }
      },
    );
  }
}

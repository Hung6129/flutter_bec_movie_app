import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bec_movie_app/screens/detailpage/cast_detail_page.dart';
import 'package:flutter_bec_movie_app/screens/homepage/homepage.dart';

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
          /// movie detail
          MovieDetail movieDetail = state.detail;
          double x = movieDetail.voteAverage!;
          double num = x / 0.1;
          int finalNum = num.round();

          ///recommended
          List<Movie> movies = state.recommendation;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  GestureDetector(
                    onTap: () {
                      print("Adding to favorite list");
                    },
                    child: Platform.isIOS
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(CupertinoIcons.heart_fill),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.favorite),
                          ),
                  ),
                ],
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
                          ? Icon(CupertinoIcons.arrow_left)
                          : Icon(Icons.arrow_back),
                    ),
                  ],
                ),
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
                    errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/not_found_images.png'),
                        ),
                      ),
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
                            errorWidget: (context, url, error) => Container(
                              width: maxWidth / (maxWidth / 120),
                              height: maxHeight / (maxHeight / 180),
                              decoration: const BoxDecoration(
                                color: Constrant.p4,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/not_found_images.png',
                                  ),
                                ),
                              ),
                            ),
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
                                  height: maxHeight / (maxHeight / 10),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Run Time: ',
                                    style: TextStyle(
                                        fontSize: maxHeight / (maxHeight / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Constrant.p3),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${movieDetail.runtime} min",
                                        style: TextStyle(
                                            fontSize:
                                                maxHeight / (maxHeight / 15),
                                            fontWeight: FontWeight.bold,
                                            color: Constrant.textBlack),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    MaterialButton(
                                      shape: const CircleBorder(),
                                      color: Constrant.p6,
                                      onPressed: () async {
                                        final youtubeUrl =
                                            'https://www.youtube.com/embed/${movieDetail.trailerId}';
                                        if (await canLaunchUrl(
                                            Uri.parse(youtubeUrl))) {
                                          await launchUrl(
                                              Uri.parse(youtubeUrl));
                                        }
                                      },
                                      child: const Icon(
                                        Icons.play_arrow,
                                        size: 20,
                                        color: Constrant.p3,
                                      ),
                                    ),
                                    MaterialButton(
                                      shape: const CircleBorder(),
                                      color: Constrant.p6,
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.favorite_border,
                                        size: 20,
                                        color: Constrant.p3,
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

                    /// vote
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
                              movieDetail.voteCount.toString(),
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
                              finalNum.toString() + "%",
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
                              movieDetail.popularity.toString(),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieDetail.overview!,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Constrant.textBlack,
                                  fontSize: maxHeight / (maxHeight / 15)),
                            ),
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
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CastDetailPage(movieCre: cast),
                                      ),
                                    );
                                  },
                                  child: Card(
                                      color: Constrant.p4,
                                      elevation: 1.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: maxHeight / (maxHeight / 200),
                                          width: maxWidth / (maxWidth / 150),
                                          child: Column(
                                            children: [
                                              CachedNetworkImage(
                                                height: maxHeight /
                                                    (maxHeight / 180),
                                                width:
                                                    maxWidth / (maxWidth / 160),
                                                fit: BoxFit.cover,
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
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      cast.name!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      // overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Constrant.p3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: maxHeight /
                                                            (maxHeight / 12),
                                                      ),
                                                    ),
                                                    Text(
                                                      cast.character!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        color: Constrant.p2,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: maxHeight /
                                                            (maxHeight / 9),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
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

                    /// Recommendation list
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommended for you",
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Constrant.p3,
                                fontWeight: FontWeight.bold,
                                fontSize: maxHeight / (maxHeight / 20)),
                          ),
                          movies.isEmpty
                              ? const Text(
                                  "Sorry ! We don't have enough data to suggest any movies based on Luck. You can help by rating movies you've seen.")
                              : SizedBox(
                                  width: double.maxFinite,
                                  height: maxHeight / (maxHeight / 250),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movies.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailScreen(
                                                    movie: movies[index]),
                                          ),
                                        ),
                                        child: Card(
                                            color: Constrant.p6,
                                            elevation: 1.5,
                                            child: SizedBox(
                                              height:
                                                  maxHeight / (maxHeight / 200),
                                              width:
                                                  maxWidth / (maxWidth / 150),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: CachedNetworkImage(
                                                      height: maxHeight /
                                                          (maxHeight / 200),
                                                      width: maxWidth /
                                                          (maxWidth / 150),
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          "https://image.tmdb.org/t/p/original/${movies[index].posterPath}",
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
                                                      errorWidget: (context,
                                                          url, error) {
                                                        return Container(
                                                          width: maxHeight /
                                                              (maxHeight / 120),
                                                          color: Constrant.p6,
                                                          child: Image.asset(
                                                              "assets/not_found_images.png"),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      movies[index].title!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Constrant.p3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: maxHeight /
                                                            (maxHeight / 12),
                                                      ),
                                                    ),
                                                  )
                                                ],
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
          return const Center(
            child: AppText(
              text: "Somethings went wrong!!",
              color: Colors.black,
            ),
          );
        } else {
          return Center(
            child: AppText(
              text: "Somethings went wrong!!",
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}

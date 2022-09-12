import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../config/urls.dart';
import '../../widgets/horizontal_list_items.dart';
import '/config/palettes.dart';
import '/config/view/erorr_page.dart';
import '/model/tv_show_detail_model.dart';
import '/model/tv_show_model.dart';
import '/widgets/horizontal_cast_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../bloc/tv_show_detail_bloc/tv_show_detail_bloc.dart';
import '../../bloc/tv_show_detail_bloc/tv_show_detail_event.dart';

class TVShowDetailPage extends StatelessWidget {
  final TVShowModel tvShowModel;

  const TVShowDetailPage({Key? key, required this.tvShowModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TVShowDetailBloc()
        ..add(
          TVShowDetailEventStated(tvShowModel.id!),
        ),
      child: WillPopScope(
        child: Scaffold(
          body: _buildDetailBody(context),
        ),
        onWillPop: () async => true,
      ),
    );
  }

  Widget _buildDetailBody(BuildContext context) {
    print(tvShowModel.id);
    return BlocBuilder<TVShowDetailBloc, TVShowDetailState>(
      builder: (context, state) {
        double maxHeight = MediaQuery.of(context).size.height;
        double maxWidth = MediaQuery.of(context).size.width;
        if (state is TVShowDetailLoading) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Icon(Icons.home),
                // automaticallyImplyLeading: false,
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
        } else if (state is TVShowDetailLoaded) {
          /// movie detail
          TVShowDetailModel tvShowDetail = state.detail;
          double x = tvShowDetail.voteAverage!;
          double num = x / 0.1;
          int finalNum = num.round();

          ///recommended
          List<TVShowModel> tvShowRecommended = state.recommendation;

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: true,
                iconTheme: IconThemeData(color: Palettes.p3),
                actions: [
                  IconButton(
                    iconSize: 24,
                    icon: const Icon(
                      Icons.home_filled,
                    ),
                    color: Palettes.p3,
                    onPressed: () {},
                  ),
                ],
                stretch: true,
                stretchTriggerOffset: 100,
                toolbarHeight: maxHeight / (maxHeight / 50),
                backgroundColor: Palettes.p6,
                pinned: true,
                expandedHeight: maxHeight / (maxHeight / 300),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                    StretchMode.blurBackground,
                  ],
                  background: CachedNetworkImage(
                    imageUrl: Urls.imagesUrl + tvShowDetail.backdropPath!,
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
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        tvShowDetail.name ?? "Phim Hay",
                        textAlign: TextAlign.center,
                        style: Palettes.movieTitle,
                      ),
                    ),

                    /// Poster and play trailer
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          /// Poster
                          CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${tvShowDetail.posterPath}',
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
                                color: Palettes.p4,
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
                                Text(tvShowDetail.tagline!,
                                    style: Palettes.bodyText),
                                SizedBox(
                                  height: maxHeight / (maxHeight / 10),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Release Date: ',
                                    style: TextStyle(
                                      fontSize: maxHeight / (maxHeight / 15),
                                      fontWeight: FontWeight.bold,
                                      color: Palettes.p3,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: tvShowDetail.firstAirDate,
                                          style: Palettes.bodyText),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Run Time: ',
                                    style: TextStyle(
                                        fontSize: maxHeight / (maxHeight / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Palettes.p3),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "${tvShowDetail.numberOfEpisodes} eps",
                                          style: Palettes.bodyText),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    MaterialButton(
                                      shape: const CircleBorder(),
                                      color: Palettes.p6,
                                      onPressed: () async {
                                        final youtubeUrl =
                                            'https://www.youtube.com/embed/${tvShowDetail.trailerId}';
                                        if (await canLaunchUrl(
                                            Uri.parse(youtubeUrl))) {
                                          await launchUrl(
                                              Uri.parse(youtubeUrl));
                                        }
                                      },
                                      child: const Icon(
                                        Icons.play_arrow,
                                        size: 20,
                                        color: Palettes.p3,
                                      ),
                                    ),
                                    MaterialButton(
                                      shape: const CircleBorder(),
                                      color: Palettes.p6,
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.favorite_border,
                                        size: 20,
                                        color: Palettes.p3,
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
                              height: maxHeight / (maxHeight / 35),
                              width: maxWidth / (maxWidth / 35),
                            ),
                            Text(tvShowDetail.voteCount.toString(),
                                style: Palettes.kHeading6),
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
                            Text(finalNum.toString() + "%",
                                style: Palettes.kHeading6),
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
                            Text(tvShowDetail.popularity.toString(),
                                style: Palettes.kHeading6),
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
                            style: Palettes.movieTitle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              tvShowDetail.overview!,
                              // overflow: TextOverflow.ellipsis,
                              style: Palettes.bodyText,
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
                            "Top billed cast",
                            // overflow: TextOverflow.ellipsis,
                            style: Palettes.movieTitle,
                          ),
                          HorizontalCastList(
                              topBillCasted: true,
                              peopleList: tvShowDetail.topBillCastedList)
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
                            style: Palettes.movieTitle,
                          ),
                          tvShowRecommended.isEmpty
                              ? Text(
                                  "Sorry ! We don't have enough data to suggest any movies based on Luck. You can help by rating movies you've seen.",
                                  style: Palettes.bodyText,
                                )
                              : HorizontalItems(
                                  isTVShow: true,
                                  list: tvShowRecommended,
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: maxHeight / (maxHeight / 50),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is TVShowDetailError) {
          return ErrorPage(errorText: "CON CAC");
        } else {
          return Container();
        }
      },
    );
  }
}

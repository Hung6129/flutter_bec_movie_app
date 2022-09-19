import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../bloc/tv_show_detail_bloc/tv_show_detail_bloc.dart';
import '../../../bloc/tv_show_detail_bloc/tv_show_detail_event.dart';
import '../../../config/urls.dart';
import '../../../data_layer/model/tv_show_detail_model.dart';
import '../../../data_layer/model/tv_show_model.dart';
import '../../widgets/cus_text_btn.dart';
import '../../widgets/horizontal_cast_list.dart';
import '../../widgets/horizontal_list_items.dart';
import '../../widgets/loading_detail_page.dart';
import '../../widgets/row_vote_icons.dart';
import '/config/palettes.dart';
import '/config/view/erorr_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TVShowDetailPage extends StatefulWidget {
  final TVShowModel tvShowModel;

  const TVShowDetailPage({Key? key, required this.tvShowModel})
      : super(key: key);

  @override
  State<TVShowDetailPage> createState() => _TVShowDetailPageState();
}

class _TVShowDetailPageState extends State<TVShowDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TVShowDetailBloc()
        ..add(
          TVShowDetailEventStated(widget.tvShowModel.id!),
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
    print(widget.tvShowModel.id);
    return BlocBuilder<TVShowDetailBloc, TVShowDetailState>(
      builder: (context, state) {
        double maxHeight = MediaQuery.of(context).size.height;
        double maxWidth = MediaQuery.of(context).size.width;
        if (state is TVShowDetailLoading) {
          return LoadingDetailPage();
        } else if (state is TVShowDetailLoaded) {
          /// movie detail
          TVShowDetailModel tvShowDetail = state.detail;
          var listGenres = tvShowDetail.genres!
              .map((e) => e.name)
              .reduce((value, element) => value! + ", " + element!);

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
                // stretchTriggerOffset: 100,
                toolbarHeight: maxHeight / (maxHeight / 50),
                backgroundColor: Palettes.p6,
                pinned: true,
                expandedHeight: maxHeight / (maxHeight / 300),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    // StretchMode.fadeTitle,
                    // StretchMode.blurBackground,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(tvShowDetail.tagline!,
                                    style: Palettes.bodyText),
                                RichText(
                                  text: TextSpan(
                                    text: 'First Air Date: ',
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
                                    text: 'Last Air Date: ',
                                    style: TextStyle(
                                      fontSize: maxHeight / (maxHeight / 15),
                                      fontWeight: FontWeight.bold,
                                      color: Palettes.p3,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: tvShowDetail.lastAirDate ??
                                              "Unknow",
                                          style: Palettes.bodyText),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Total Season: ',
                                    style: TextStyle(
                                        fontSize: maxHeight / (maxHeight / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Palettes.p3),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "${tvShowDetail.numberOfSeasons} Season",
                                          style: Palettes.bodyText),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Genres: ',
                                    style: TextStyle(
                                        fontSize: maxHeight / (maxHeight / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Palettes.p3),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: listGenres ?? "Unknow",
                                          style: Palettes.bodyText),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // CustomTextButton(
                    //     url: tvShowDetail.trailerId, listMovie: []),
                    RowVoteIcons(
                      popularity: tvShowDetail.popularity!,
                      voteAverage: tvShowDetail.voteAverage!,
                      voteCount: tvShowDetail.voteCount!,
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

                    /// Episodes
                    Text(
                      "Episodes",
                      // overflow: TextOverflow.ellipsis,
                      style: Palettes.movieTitle,
                    ),
                    SizedBox(
                      height: maxHeight / (maxHeight / 300),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: Urls.imagesUrl +
                                              "/8rImnE8aUT3LUS2WGXaBSnx6ip1.jpg",
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:
                                                maxHeight / (maxHeight / 200),
                                            child: Text(
                                              // '${seasonEpisode.episodeNumber}. ${seasonEpisode.name}',
                                              "1. A Normal Amount of Rage",
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // DateFormat('MMM dd, yyyy').format(
                                            //   DateTime.parse(
                                            //       seasonEpisode.airDate),
                                            // ),
                                            "Aug 18, 2022",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "A young lawyer living in Los Angeles deals with the trials and tribulations of becoming a famous superheroine, and making a film about how all of that came to be.",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.0,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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

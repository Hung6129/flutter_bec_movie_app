import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../../../bloc/movie_detail_bloc/movie_detail_event.dart';
import '../../../config/urls.dart';
import '../../../data_layer/model/movie_detail_model.dart';
import '../../../data_layer/model/movie_model.dart';
import '../../widgets/cus_text_btn.dart';
import '../../widgets/horizontal_cast_list.dart';
import '../../widgets/horizontal_list_items.dart';
import '../../widgets/loading_detail_page.dart';
import '../../widgets/row_vote_icons.dart';
import '/config/palettes.dart';
import '/config/view/erorr_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailBloc()
        ..add(
          MovieDetailEventStated(movie.id!),
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
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        double maxHeight = MediaQuery.of(context).size.height;
        double maxWidth = MediaQuery.of(context).size.width;
        if (state is MovieDetailLoading) {
          return LoadingDetailPage();
        } else if (state is MovieDetailLoaded) {
          /// movie detail
          MovieDetail movieDetail = state.detail;
          var listGenres = movieDetail.genres!
              .map((e) => e.name)
              .reduce((value, element) => value! + ", " + element!);

          /// cast map
          var maps = {
            'id': movieDetail.id,
            'name': movieDetail.title,
            'posterPath': movieDetail.poster_path,
          };

          ///recommended
          List<Movie> movies = state.recommendation;

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
                    imageUrl: Urls.imagesUrl + movieDetail.backdropPath!,
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
                          movieDetail.originalTitle!,
                          textAlign: TextAlign.center,
                          style: Palettes.movieTitle,
                        )),

                    /// Poster
                    Padding(
                      padding: const EdgeInsets.all(4),
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
                                Text(movieDetail.tagline!,
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
                                          text: movieDetail.releaseDate,
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
                                              "${movieDetail.runtime} minutes",
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

                    /// vote
                    RowVoteIcons(
                      popularity: movieDetail.popularity!,
                      voteAverage: movieDetail.voteAverage!,
                      voteCount: movieDetail.voteCount!,
                    ),
                    SizedBox(
                      height: maxHeight / (maxHeight / 10),
                    ),

                    ///add to favorite and play trailer
                    CustomTextButton(
                      isMovie: true,
                      data: maps,
                      url: movieDetail.trailerId,
                      // movieDetail: movieDetail,
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
                              movieDetail.overview!,
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
                              peopleList: movieDetail.topBillCastedList)
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
                          movies.isEmpty
                              ? Text(
                                  "Sorry ! We don't have enough data to suggest any movies based on Luck. You can help by rating movies you've seen.",
                                  style: Palettes.bodyText,
                                )
                              : HorizontalItems(
                                  list: movies,
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
        } else if (state is MovieDetailError) {
          return ErrorPage(errorText: state.error);
        } else {
          return Container();
        }
      },
    );
  }
}

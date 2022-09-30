import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/text_style.dart';
import '../../../data_layer/model/cast_model.dart';
import '../../../data_layer/model/movie_cast.dart';
import '../../../data_layer/model/movie_model.dart';
import '../../widgets/horizontal_list_items.dart';
import '/config/palettes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '/bloc/cast_detail/cast_detail_bloc_bloc.dart';

class CastDetailPage extends StatelessWidget {
  MovieCast movieCre;
  CastDetailPage({
    Key? key,
    required this.movieCre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    /// build body
    Widget _buildBody(CastModel dataCast, List<Movie> creditMovie) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  /// Poster
                  CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original/${dataCast.profilePath}',
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
                        Text(dataCast.name!,
                            // overflow: TextOverflow.ellipsis,
                            style:
                                TextStyles.defaultStyle.bold.primaryTextColor),
                        SizedBox(
                          height: maxHeight / (maxHeight / 15),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Place of Birth: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 12),
                                fontWeight: FontWeight.bold,
                                color: Palettes.p3),
                            children: <TextSpan>[
                              TextSpan(
                                  text: dataCast.placeOfBirth,
                                  style: TextStyles.defaultStyle),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: maxHeight / (maxHeight / 5),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Gender: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 12),
                                fontWeight: FontWeight.bold,
                                color: Palettes.p3),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      dataCast.gender == 1 ? "Female" : "Male",
                                  style: TextStyles.defaultStyle),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: maxHeight / (maxHeight / 5),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Birthday: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 12),
                                fontWeight: FontWeight.bold,
                                color: Palettes.p3),
                            children: <TextSpan>[
                              TextSpan(
                                  text: dataCast.birthday,
                                  style: TextStyles.defaultStyle),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: maxHeight / (maxHeight / 5),
                        ),
                        dataCast.deathday == null
                            ? SizedBox()
                            : RichText(
                                text: TextSpan(
                                  text: 'Deathday: ',
                                  style: TextStyle(
                                      fontSize: maxHeight / (maxHeight / 12),
                                      fontWeight: FontWeight.bold,
                                      color: Palettes.p3),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: dataCast.deathday,
                                        style: TextStyles.defaultStyle),
                                  ],
                                ),
                              ),
                        dataCast.deathday == null
                            ? SizedBox()
                            : SizedBox(
                                height: maxHeight / (maxHeight / 5),
                              ),
                        RichText(
                          text: TextSpan(
                            text: 'Known For: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 12),
                                fontWeight: FontWeight.bold,
                                color: Palettes.p3),
                            children: <TextSpan>[
                              TextSpan(
                                  text: dataCast.knownForDepartment,
                                  style: TextStyles.defaultStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                /// biography
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Biography",
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyles.defaultStyle.bold.primaryTextColor),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataCast.biography!,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyles.defaultStyle),
                      ),
                    ],
                  ),
                ),

                /// Credit list
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Know for",
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyles.defaultStyle.bold.primaryTextColor),
                      creditMovie.isEmpty
                          ? Text(
                              "Sorry ! We don't have enough data to suggest any movies based on Luck. You can help by rating movies you've seen.",
                              style: TextStyles.defaultStyle,
                            )
                          : HorizontalItems(
                              list: creditMovie,
                            )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: maxHeight / (maxWidth / 30),
            ),
          ],
        ),
      );
    }

    /// build loading body
    Widget _buildLoadingBody() {
      return Column(
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
      );
    }

    /// build appbar
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Palettes.p3,
      );
    }

    return BlocProvider(
      create: (_) =>
          CastDetailBlocBloc()..add(CastDetailEventStated(movieCre.id!)),
      child: WillPopScope(
        child: SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(),
            body: BlocBuilder<CastDetailBlocBloc, CastDetailBlocState>(
              builder: (context, state) {
                if (state is CastDetailBlocLoading) {
                  return _buildLoadingBody();
                }
                if (state is CastDetailBlocLoaded) {
                  var data = state.castModel;
                  List<Movie> creditData = state.castCreditsMovie;
                  return _buildBody(data, creditData);
                } else {
                  return Center(
                    child: Text("Somthing went wrong!!"),
                  );
                }
              },
            ),
          ),
        ),
        onWillPop: () async => true,
      ),
    );
  }
}

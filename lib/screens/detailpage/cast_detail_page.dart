import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/model/movie_cast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_bec_movie_app/bloc/cast_detail/cast_detail_bloc_bloc.dart';
import 'package:flutter_bec_movie_app/model/movie_detail_model.dart';

import '../../model/cast_model.dart';
import '../../widgets/constrant.dart';

class CastDetailPage extends StatelessWidget {
  MovieCast movieCre;
  CastDetailPage({
    Key? key,
    required this.movieCre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// build body
    Widget _buildBody(CastModel dataCast) {
      double maxHeight = MediaQuery.of(context).size.height;
      double maxWidth = MediaQuery.of(context).size.width;
      return SingleChildScrollView(
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
                          dataCast.name!,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Constrant.p2,
                              fontSize: maxHeight / (maxHeight / 20)),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Place of Birth: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 14),
                                fontWeight: FontWeight.bold,
                                color: Constrant.p3),
                            children: <TextSpan>[
                              TextSpan(
                                text: dataCast.placeOfBirth,
                                style: TextStyle(
                                    fontSize: maxHeight / (maxHeight / 14),
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
                            text: 'Gender: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 14),
                                fontWeight: FontWeight.bold,
                                color: Constrant.p3),
                            children: <TextSpan>[
                              TextSpan(
                                text: dataCast.gender == 1 ? "Female" : "Male",
                                style: TextStyle(
                                    fontSize: maxHeight / (maxHeight / 14),
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
                            text: 'Birthday: ',
                            style: TextStyle(
                                fontSize: maxHeight / (maxHeight / 14),
                                fontWeight: FontWeight.bold,
                                color: Constrant.p3),
                            children: <TextSpan>[
                              TextSpan(
                                text: dataCast.birthday,
                                style: TextStyle(
                                    fontSize: maxHeight / (maxHeight / 14),
                                    fontWeight: FontWeight.bold,
                                    color: Constrant.textBlack),
                              ),
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
                                      fontSize: maxHeight / (maxHeight / 14),
                                      fontWeight: FontWeight.bold,
                                      color: Constrant.p3),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: dataCast.deathday,
                                      style: TextStyle(
                                          fontSize:
                                              maxHeight / (maxHeight / 14),
                                          fontWeight: FontWeight.bold,
                                          color: Constrant.textBlack),
                                    ),
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
                                fontSize: maxHeight / (maxHeight / 14),
                                fontWeight: FontWeight.bold,
                                color: Constrant.p3),
                            children: <TextSpan>[
                              TextSpan(
                                text: dataCast.knownForDepartment,
                                style: TextStyle(
                                    fontSize: maxHeight / (maxHeight / 14),
                                    fontWeight: FontWeight.bold,
                                    color: Constrant.textBlack),
                              ),
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
                      Text(
                        "Biography",
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Constrant.p3,
                            fontWeight: FontWeight.bold,
                            fontSize: maxHeight / (maxHeight / 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataCast.biography!,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Constrant.textBlack,
                              fontSize: maxHeight / (maxHeight / 15)),
                        ),
                      ),
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
                      // movies.isEmpty
                      //     ? const Text(
                      //         "Sorry ! We don't have enough data to suggest any movies based on Luck. You can help by rating movies you've seen.")
                      //     :
                      SizedBox(
                        width: double.maxFinite,
                        height: maxHeight / (maxHeight / 250),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         MovieDetailScreen(movie: movies[index]),
                                //   ),
                                // );
                              },
                              child: Card(
                                  color: Constrant.p6,
                                  elevation: 1.5,
                                  child: SizedBox(
                                    height: maxHeight / (maxHeight / 200),
                                    width: maxWidth / (maxWidth / 150),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CachedNetworkImage(
                                        height: maxHeight / (maxHeight / 200),
                                        width: maxWidth / (maxWidth / 150),
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/original//2162lAT2MP36MyJd2sttmj5du5T.jpg",
                                        placeholder: (ctx, url) =>
                                            Shimmer.fromColors(
                                          baseColor: (Colors.grey[300])!,
                                          highlightColor: (Colors.grey[100])!,
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            width:
                                                maxHeight / (maxHeight / 120),
                                            color: Constrant.p6,
                                            child: Image.asset(
                                                "assets/not_found_images.png"),
                                          );
                                        },
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
              ],
            ),
            SizedBox(
              height: maxHeight / (maxWidth / 30),
            )
          ],
        ),
      );
    }

    /// build appbar
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Constrant.p3,
        actions: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 30,
          )
        ],
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
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CastDetailBlocLoaded) {
                  var data = state.castModel;
                  return _buildBody(data);
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

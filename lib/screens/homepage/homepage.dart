import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';
import 'package:flutter_bec_movie_app/screens/searchpage/search_page.dart';
import 'package:flutter_bec_movie_app/widgets/heading_w_sub.dart';
import 'package:flutter_bec_movie_app/widgets/horizontal_cast_list.dart';
import 'package:flutter_bec_movie_app/widgets/horizontal_list_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
import '../../widgets/app_text.dart';
import '../../widgets/horizontal_list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _maxHeight = MediaQuery.of(context).size.height;
    double _maxWidth = MediaQuery.of(context).size.width;

    /// build body
    Widget _buildBoody() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              textTitle: "Now Playing",
              onSeeMoreTapped: () {},
            ),

            BlocBuilder<MovieBlocBloc, MovieBlocState>(
              builder: (context, state) {
                if (state is MovieBlocLoading) {
                  return ShimmerListHorizontal();
                } else if (state is MovieBlocLoaded) {
                  var movies = state.nowPlayingList;
                  return HorizontalItems(movies: movies);
                } else {
                  return const AppText(text: "Something went wrong");
                }
              },
            ),

            SizedBox(
              height: _maxHeight / (_maxHeight / 10),
            ),

            SubHeading(
              textTitle: "Popular People",
              onSeeMoreTapped: () {},
            ),
            BlocBuilder<MovieBlocBloc, MovieBlocState>(
              builder: (context, state) {
                if (state is MovieBlocLoading) {
                  return ShimmerListHorizontal();
                } else if (state is MovieBlocLoaded) {
                  var cast = state.peopleList;
                  return HorizontalCastList(
                    peopleList: cast,
                    topBillCasted: false,
                  );
                } else {
                  return const AppText(text: "Something went wrong");
                }
              },
            ),
            SizedBox(
              height: _maxHeight / (_maxHeight / 10),
            ),

            SubHeading(
              textTitle: "Top Rated",
              onSeeMoreTapped: () {},
            ),
            BlocBuilder<MovieBlocBloc, MovieBlocState>(
              builder: (context, state) {
                if (state is MovieBlocLoading) {
                  return ShimmerListHorizontal();
                } else if (state is MovieBlocLoaded) {
                  var movies = state.topRated;
                  return HorizontalItems(movies: movies);
                } else {
                  return const AppText(text: "Something went wrong");
                }
              },
            ),
            SizedBox(
              height: _maxHeight / (_maxHeight / 50),
            ),
            // BlocBuilder<MovieBlocBloc, MovieBlocState>(
            //   builder: (context, state) {
            //     if (state is MovieBlocLoading) {
            //       return Container(
            //         padding: const EdgeInsets.only(left: 20),
            //         height: 220,
            //         width: double.maxFinite,
            //         child: ListView.builder(
            //           itemCount: 5,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Shimmer.fromColors(
            //               baseColor: (Colors.grey[300])!,
            //               highlightColor: (Colors.grey[300])!,
            //               child: Container(
            //                 margin: const EdgeInsets.only(right: 20, top: 10),
            //                 color: Colors.white,
            //                 width: 150,
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     } else if (state is MovieBlocLoaded) {
            //       var movies = state.popularList;
            //       return SizedBox(
            //         width: double.maxFinite,
            //         height: 250,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: movies.length,
            //           itemBuilder: (context, index) {
            //             Movie movie = movies[index];
            //             return GestureDetector(
            //               onTap: () => Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) =>
            //                       MovieDetailScreen(movie: movie),
            //                 ),
            //               ),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: CachedNetworkImage(
            //                   imageUrl:
            //                       Urls.imagesUrl + movies[index].posterPath!,
            //                   placeholder: (ctx, url) => Shimmer.fromColors(
            //                     baseColor: (Colors.grey[300])!,
            //                     highlightColor: (Colors.grey[100])!,
            //                     child: Container(
            //                       color: Colors.white,
            //                       // width: 150,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     } else {
            //       return const AppText(text: "Something went wrong");
            //     }
            //   },
            // ),

            // SizedBox(
            //   height: _maxHeight / (_maxHeight / 10),
            // ),

            // /// people
            // SubHeading(
            //   textTitle: "Trending People",
            //   onSeeMoreTapped: () {},
            // ),

            // BlocBuilder<MovieBlocBloc, MovieBlocState>(
            //   builder: (context, state) {
            //     if (state is MovieBlocLoading) {
            //       return Container(
            //         padding: const EdgeInsets.only(left: 20),
            //         height: 220,
            //         width: double.maxFinite,
            //         child: ListView.builder(
            //           itemCount: 5,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Shimmer.fromColors(
            //               baseColor: (Colors.grey[300])!,
            //               highlightColor: (Colors.grey[300])!,
            //               child: Container(
            //                 margin: const EdgeInsets.only(right: 20, top: 10),
            //                 color: Colors.white,
            //                 width: 150,
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     } else if (state is MovieBlocLoaded) {
            //       var people = state.peopleList;
            //       return
            // SizedBox(
            //         width: double.maxFinite,
            //         height: 250,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: people.length,
            //           itemBuilder: (context, index) {
            //             return GestureDetector(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) =>
            //                         CastDetailPage(movieCre: people[index]),
            //                   ),
            //                 );
            //               },
            //               child: Card(
            //                   color: Palettes.p4,
            //                   elevation: 1.5,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: SizedBox(
            //                       height: _maxHeight / (_maxHeight / 200),
            //                       width: _maxWidth / (_maxWidth / 150),
            //                       child: Column(
            //                         children: [
            //                           CachedNetworkImage(
            //                             height: _maxHeight / (_maxHeight / 180),
            //                             width: _maxWidth / (_maxWidth / 160),
            //                             fit: BoxFit.cover,
            //                             imageUrl:
            //                                 "https://image.tmdb.org/t/p/original/${people[index].profilePath}",
            //                             placeholder: (ctx, url) =>
            //                                 Shimmer.fromColors(
            //                               baseColor: (Colors.grey[300])!,
            //                               highlightColor: (Colors.grey[100])!,
            //                               child: Container(
            //                                 color: Colors.white,
            //                               ),
            //                             ),
            //                             errorWidget: (context, url, error) {
            //                               return Container(
            //                                 width:
            //                                     _maxHeight / (_maxHeight / 120),
            //                                 color: Palettes.p6,
            //                                 child: Image.asset(
            //                                     "assets/not_found_images.png"),
            //                               );
            //                             },
            //                           ),
            //                           Container(
            //                             padding: EdgeInsets.all(5),
            //                             child: Column(
            //                               children: [
            //                                 Text(
            //                                   people[index].name!,
            //                                   textAlign: TextAlign.center,
            //                                   overflow: TextOverflow.ellipsis,
            //                                   maxLines: 1,
            //                                   style: TextStyle(
            //                                     color: Palettes.p3,
            //                                     fontWeight: FontWeight.bold,
            //                                     fontSize: _maxHeight /
            //                                         (_maxHeight / 12),
            //                                   ),
            //                                 ),
            //                                 Text(
            //                                   people[index].knownForDepartment!,
            //                                   overflow: TextOverflow.ellipsis,
            //                                   maxLines: 2,
            //                                   style: TextStyle(
            //                                     color: Palettes.p2,
            //                                     fontWeight: FontWeight.bold,
            //                                     fontSize: _maxHeight /
            //                                         (_maxHeight / 9),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   )),
            //             );
            //           },
            //         ),
            //       );
            //     } else {
            //       return const AppText(text: "Something went wrong");
            //     }
            //   },
            // ),
            // SizedBox(
            //   height: _maxHeight / (_maxHeight / 50),
            // ),
          ],
        ),
      );
    }

    /// build app bar
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Palettes.p3.withOpacity(0.9),
        title: Text(
          'BecMovie',
          style: Palettes.kHeading7,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: Platform.isAndroid
                ? Icon(Icons.search)
                : Icon(CupertinoIcons.search),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.open();
          },
          icon: Platform.isAndroid
              ? Icon(Icons.menu)
              : Icon(CupertinoIcons.list_bullet),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBoody(),
      ),
    );
  }
}

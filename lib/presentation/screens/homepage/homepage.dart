import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/text_style.dart';
import '../../../bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
import '../../widgets/heading_w_sub.dart';
import '../../widgets/horizontal_cast_list.dart';
import '../../widgets/horizontal_list_shimmer.dart';
import '../searchpage/search_page.dart';
import '/config/palettes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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

    /// build body
    Widget _buildBoody() {
      return Column(
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
                return HorizontalItems(list: movies);
              } else if (state is MovieBlocError) {
                return const AppText(text: "Something went wrong");
              } else {
                return ShimmerListHorizontal();
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
              } else if (state is MovieBlocError) {
                return const AppText(text: "Something went wrong");
              } else {
                return ShimmerListHorizontal();
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
                return HorizontalItems(list: movies);
              } else if (state is MovieBlocError) {
                return const AppText(text: "Something went wrong");
              } else {
                return ShimmerListHorizontal();
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
        ],
      );
    }

    /// build app bar
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Palettes.p3.withOpacity(0.9),
        title: Text(
          'BecMovie',
          style: TextStyles.defaultStyle.fontTitle.whiteTextColor,
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
        body: SingleChildScrollView(child: _buildBoody()),
      ),
    );
  }
}

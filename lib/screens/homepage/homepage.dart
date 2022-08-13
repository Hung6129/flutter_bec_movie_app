import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/model/movie_cast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/movie_homepage_bloc/movie_bloc_bloc.dart';
import '../../model/movie_model.dart';
import '../../service/authenticate.dart';
import '../../widgets/app_text.dart';
import '../../widgets/constrant.dart';
import '../detailpage/cast_detail_page.dart';
import '../detailpage/movie_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// Set texteditcontroller
final TextEditingController _txtController = TextEditingController();

bool statusTrending = false;
bool statusPopular = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _maxHeight = MediaQuery.of(context).size.height;
    double _maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/iHun.png",
                  height: _maxHeight / (_maxHeight / 150),
                  width: _maxWidth / (_maxWidth / 200),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  children: [
                    AppText(
                      text:
                          "Hello! ${FirebaseAuth.instance.currentUser!.displayName!}",
                      color: Constrant.p3,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Icon(Icons.logout, size: 15),
                      onTap: () => Authentication().signOut(),
                    )
                  ],
                ),
              ),

              /// Search bar
              Container(
                padding: EdgeInsets.only(
                    top: _maxHeight / (_maxHeight / 10),
                    bottom: _maxHeight / (_maxHeight / 10),
                    left: _maxWidth / (_maxWidth / 40),
                    right: _maxWidth / (_maxWidth / 40)),
                color: Constrant.p6,
                child: TextField(
                  style: TextStyle(fontSize: 15), // <-- SEE HERE
                  autofocus: false,
                  controller: _txtController,
                  cursorColor: Constrant.p3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: _maxHeight / (_maxHeight / 10),
                        horizontal: _maxWidth / (_maxWidth / 10)),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Constrant.p7),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Constrant.textBlack),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => print(_txtController.text),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Constrant.textBlack,
                      ),
                    ),
                    labelText: 'Search for a movie, tv show,...',
                    labelStyle: const TextStyle(color: Constrant.textBlack),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              /// popular
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const AppText(
                    text: "What's Popular",
                    color: Constrant.p3,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FlutterSwitch(
                    padding: 8,
                    activeColor: Constrant.p3,
                    inactiveColor: Constrant.p6,
                    activeText: "TVs",
                    inactiveText: "Theaters",
                    activeTextColor: Constrant.p6,
                    inactiveTextColor: Constrant.p3,
                    width: _maxWidth / (_maxWidth / 105),
                    height: _maxHeight / (_maxHeight / 35),
                    valueFontSize: _maxHeight / (_maxHeight / 15),
                    toggleSize: _maxHeight / (_maxHeight / 22),
                    value: statusPopular,
                    borderRadius: _maxHeight / (_maxHeight / 20),
                    // padding: _maxHeight / (_maxHeight / 10),
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        statusPopular = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<MovieBlocBloc, MovieBlocState>(
                builder: (context, state) {
                  if (state is MovieBlocLoading) {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        // viewportFraction: 1,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index, realIdx) {
                        return Shimmer.fromColors(
                          baseColor: (Colors.grey[300])!,
                          highlightColor: (Colors.grey[100])!,
                          child: Container(
                            color: Colors.white,
                            // width: 150,
                          ),
                        );
                      },
                    );
                  } else if (state is MovieBlocLoaded) {
                    var movies = state.popularList;

                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIdx) {
                        Movie movie = movies[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(movie: movie),
                            ),
                          ),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: Constrant.imagesUrl +
                                    movies[index].backdropPath!,
                                placeholder: (ctx, url) => Shimmer.fromColors(
                                  baseColor: (Colors.grey[300])!,
                                  highlightColor: (Colors.grey[100])!,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  color: Constrant.p3,
                                  child: Center(
                                    child: Text(
                                      movies[index].title!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            _maxHeight / (_maxHeight / 18),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const AppText(text: "Something went wrong");
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),

              /// trending
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const AppText(
                    text: "Trending",
                    color: Constrant.p3,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FlutterSwitch(
                    padding: 8,
                    activeColor: Constrant.p3,
                    inactiveColor: Constrant.p6,
                    activeText: "Weeks",
                    inactiveText: "Days",
                    activeTextColor: Constrant.p6,
                    inactiveTextColor: Constrant.p3,
                    width: _maxWidth / (_maxWidth / 90),
                    height: _maxHeight / (_maxHeight / 35),
                    valueFontSize: _maxHeight / (_maxHeight / 15),
                    toggleSize: _maxHeight / (_maxHeight / 22),
                    value: statusTrending,
                    borderRadius: _maxHeight / (_maxHeight / 20),
                    // padding: _maxHeight / (_maxHeight / 10),
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        statusTrending = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<MovieBlocBloc, MovieBlocState>(
                builder: (context, state) {
                  if (state is MovieBlocLoading) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 220,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            baseColor: (Colors.grey[300])!,
                            highlightColor: (Colors.grey[300])!,
                            child: Container(
                              margin: const EdgeInsets.only(right: 20, top: 10),
                              color: Colors.white,
                              width: 150,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is MovieBlocLoaded) {
                    var movies = state.trendingList;
                    return SizedBox(
                      width: double.maxFinite,
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          Movie movie = movies[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(movie: movie),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                imageUrl: Constrant.imagesUrl +
                                    movies[index].posterPath!,
                                placeholder: (ctx, url) => Shimmer.fromColors(
                                  baseColor: (Colors.grey[300])!,
                                  highlightColor: (Colors.grey[100])!,
                                  child: Container(
                                    color: Colors.white,
                                    // width: 150,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const AppText(text: "Something went wrong");
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),

              /// people

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: AppText(
                  text: "Popular People",
                  color: Constrant.p3,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 50,
              ),

              BlocBuilder<MovieBlocBloc, MovieBlocState>(
                builder: (context, state) {
                  if (state is MovieBlocLoading) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 220,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            baseColor: (Colors.grey[300])!,
                            highlightColor: (Colors.grey[300])!,
                            child: Container(
                              margin: const EdgeInsets.only(right: 20, top: 10),
                              color: Colors.white,
                              width: 150,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is MovieBlocLoaded) {
                    List<MovieCast> people = state.peopleList;
                    return SizedBox(
                      width: double.maxFinite,
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: people.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CastDetailPage(cast: people[index]),
                              ),
                            ),
                            child: Card(
                                color: Constrant.p4,
                                elevation: 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: _maxHeight / (_maxHeight / 200),
                                    width: _maxWidth / (_maxWidth / 150),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          height:
                                              _maxHeight / (_maxHeight / 180),
                                          width: _maxWidth / (_maxWidth / 160),
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              "https://image.tmdb.org/t/p/original/${people[index].profilePath}",
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
                                              width: _maxHeight /
                                                  (_maxHeight / 120),
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
                                                people[index].name!,
                                                textAlign: TextAlign.center,
                                                // overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Constrant.p3,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: _maxHeight /
                                                      (_maxHeight / 12),
                                                ),
                                              ),
                                              Text(
                                                people[index]
                                                    .knownForDepartment!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color: Constrant.p2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: _maxHeight /
                                                      (_maxHeight / 9),
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
                    );
                  } else {
                    return const AppText(text: "Something went wrong");
                  }
                },
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/widgets/app_text.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../widgets/constrant.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _maxHeight = MediaQuery.of(context).size.height;
    double _maxWidth = MediaQuery.of(context).size.width;

    /// build app bar
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.open();
          },
          icon: Platform.isAndroid
              ? Icon(Icons.menu)
              : Icon(CupertinoIcons.list_bullet),
        ),
        centerTitle: true,
        title: AppText(
          text: "Search Movie",
          color: Constrant.p6,
          size: _maxHeight / (_maxHeight / 18),
        ),
        backgroundColor: Constrant.p3,
      );
    }

    /// build search bar
    Widget _buildSearchBar() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          key: const Key('enterMovieQuery'),
          onChanged: (query) {
            print(query);
          },
          decoration: InputDecoration(
            hintText: 'Search movies',
            prefixIcon: const Icon(
              Icons.search,
              color: Constrant.p3,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Constrant.p3),
            ),
          ),
          textInputAction: TextInputAction.search,
          cursorColor: Constrant.p3,
        ),
      );
    }

    /// build body
    Widget _buildBody() {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Constrant.p6,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: Constrant.imagesUrl +
                          "/8rImnE8aUT3LUS2WGXaBSnx6ip1.jpg",
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shamelessly She-Hulk",
                        overflow: TextOverflow.ellipsis,
                        // style: kHeading6,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text("2009-10-05"),
                          ),
                          const SizedBox(width: 16.0),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            (3.8 / 2).toStringAsFixed(1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        "A young lawyer living in Los Angeles deals with the trials and tribulations of becoming a famous superheroine, and making a film about how all of that came to be. Visited by her cousin Bruce, who is on the run from the law, Jennifer Walters is shot by thugs hired by the gangster Nick Trask, and left for dead. Bruce saves her with an emergency blood transfusion, but in the process she takes on his powers and becomes a sensational new heroine. As her own father, Sheriff Morris Walters, declares war on the green \"monster\" she's become, and as Nick Trask declares war on her and her friends, Jennifer must decide if she's really the monster they say she is - the sort who would kill Nick Trask - or something entirely new. And she must decide if her blossoming romance with childhood friend Zapper is more important than her future as a superhero.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _maxHeight / (_maxHeight / 10),
              ),
              _buildSearchBar(),
              SizedBox(
                height: _maxHeight / (_maxHeight / 10),
              ),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }
}

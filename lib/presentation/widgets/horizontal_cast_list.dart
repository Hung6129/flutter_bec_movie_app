import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/palettes.dart';
import '../../data_layer/model/movie_cast.dart';
import '../screens/detailpage/cast_detail_page.dart';

class HorizontalCastList extends StatelessWidget {
  final List<MovieCast> peopleList;
  final bool topBillCasted;
  const HorizontalCastList({
    Key? key,
    required this.peopleList,
    required this.topBillCasted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _maxHeight = MediaQuery.of(context).size.height;
    double _maxWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: topBillCasted == true ? 250 : 220,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CastDetailPage(movieCre: peopleList[index]),
                ),
              );
            },
            child: Card(
                color: Palettes.p4,
                elevation: 1.5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: SizedBox(
                    height: _maxHeight / (_maxHeight / 200),
                    width: _maxWidth / (_maxWidth / 140),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500/${peopleList[index].profilePath}",
                            placeholder: (context, url) => Shimmer.fromColors(
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              baseColor: (Colors.grey[300])!,
                              highlightColor: (Colors.grey[100])!,
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Palettes.p6,
                              height: 170.0,
                              width: 120.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: Palettes.p3,
                                  ),
                                  Text(
                                    "No data",
                                    style: Palettes.bodyText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        topBillCasted == false
                            ? Container(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  peopleList[index].name!,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Palettes.p3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: _maxHeight / (_maxHeight / 12),
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Text(peopleList[index].name!,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Palettes.bodyText),
                                    Text(
                                      peopleList[index].character!,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Palettes.p3,
                                        fontSize:
                                            _maxHeight / (_maxHeight / 10),
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
  }
}

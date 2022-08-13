import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/bloc/cast_detail/cast_detail_bloc_bloc.dart';
import 'package:flutter_bec_movie_app/model/cast_model.dart';
import 'package:flutter_bec_movie_app/model/movie_cast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/app_text.dart';
import '../../widgets/constrant.dart';

class CastDetailPage extends StatelessWidget {
  final MovieCast cast;
  const CastDetailPage({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CastDetailBlocBloc, CastDetailBlocState>(
      builder: (context, state) {
        if (state is CastDetailBlocLoading) {
          return Container(
            color: Colors.red,
          );
        }
        if (state is CastDetailBlocLoaded) {
          CastModel castData = state.castModel;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        /// Poster
                        CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/original/${castData.profilePath}',
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
                                castData.name!,
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Constrant.p2,
                                    fontSize: maxHeight / (maxHeight / 18)),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Place of Birth: ',
                                  style: TextStyle(
                                      fontSize: maxHeight / (maxHeight / 15),
                                      fontWeight: FontWeight.bold,
                                      color: Constrant.p3),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: castData.placeOfBirth,
                                      style: TextStyle(
                                          fontSize:
                                              maxHeight / (maxHeight / 15),
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
                                      fontSize: maxHeight / (maxHeight / 15),
                                      fontWeight: FontWeight.bold,
                                      color: Constrant.p3),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${castData.birthday}",
                                      style: TextStyle(
                                          fontSize:
                                              maxHeight / (maxHeight / 15),
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
                                  text: 'Known For: ',
                                  style: TextStyle(
                                      fontSize: maxHeight / (maxHeight / 15),
                                      fontWeight: FontWeight.bold,
                                      color: Constrant.p3),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${castData.knownForDepartment}",
                                      style: TextStyle(
                                          fontSize:
                                              maxHeight / (maxHeight / 15),
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
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.blue,
          );
        }
      },
    );
  }
}

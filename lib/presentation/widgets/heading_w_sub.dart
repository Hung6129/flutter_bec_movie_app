import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';

class SubHeading extends StatelessWidget {
  final String textTitle;
  final Function() onSeeMoreTapped;

  const SubHeading({
    Key? key,
    required this.textTitle,
    required this.onSeeMoreTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        24.0,
        16.0,
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textTitle, style: Palettes.kHeading6),
          InkWell(
            onTap: onSeeMoreTapped,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text('See More'),
                  Icon(Icons.arrow_forward_ios, size: 16.0)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

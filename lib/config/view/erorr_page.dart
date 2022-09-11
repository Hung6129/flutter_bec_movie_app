import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/config/palettes.dart';

class ErrorPage extends StatelessWidget {
  final String errorText;
  const ErrorPage({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.redAccent),
            Text(
              "Something went wrong !!!",
              style: Palettes.movieTitle,
            ),
            // Text(
            //   errorText,
            //   style: Palettes.movieTitle,
            // ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go back"),
            )
          ],
        ),
      ),
    );
  }
}

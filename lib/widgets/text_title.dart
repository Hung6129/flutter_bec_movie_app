import 'package:flutter/material.dart';

import 'app_text.dart';
import 'constrant.dart';

class TextTitle extends StatelessWidget {
  final String textTitle;
  const TextTitle({Key? key, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppText(
        text: textTitle,
        color: Constrant.p3,
        size: 20,
      ),
    );
  }
}

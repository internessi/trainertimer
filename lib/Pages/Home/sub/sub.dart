import 'package:flutter/material.dart';
import '/Locale/locales.dart';

class SubListTitle extends StatelessWidget {
  final String SubListTitleText;

  SubListTitle(this.SubListTitleText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          SubListTitleText.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.white60, letterSpacing: 1),
        ),
      ],
    );
  }
}


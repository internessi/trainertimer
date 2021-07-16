import 'package:flutter/material.dart';

import '../Theme/colors.dart';

class ColorButton extends StatelessWidget {
  final String? title;
  ColorButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        title!,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
      )),
    );
  }
}

class ColorButtonGreen extends StatelessWidget {
  final String title;
  ColorButtonGreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: timerColorPauseBg,

        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}

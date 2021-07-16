import '../Theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? title;
  InputField(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        decoration: InputDecoration(
            prefixStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
            border: InputBorder.none,
            hintText: title,
            hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: greyColor, fontSize: 13, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

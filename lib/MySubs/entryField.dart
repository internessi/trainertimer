import 'package:flutter/material.dart';

import 'colors.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final InputBorder? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;

  EntryField({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.border,
    this.maxLines,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      cursorColor: blackColor,
      onTap: onTap as void Function()?,
      autofocus: false,
      controller: controller,
      initialValue: initialValue,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(color: titleColor, fontSize: 15),
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      minLines: 1,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: label,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              // fontSize: 15,
              color: greyColor,
            ),
        border: InputBorder.none,
        counter: Offstage(),
        icon: (image != null)
            ? ImageIcon(
                AssetImage(image!),
                color: buttonColor,
                size: 20.0,
              )
            : null,
      ),
    );
  }
}

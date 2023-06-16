import 'package:flutter/material.dart';

Widget commonText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  String? fontFamily,
  FontStyle? fontStyle,
  TextDecoration? decoration,
  TextAlign? textAlign,
  double? height,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
      decoration: decoration,
      height: height,
    ),
    textAlign: textAlign,
  );
}

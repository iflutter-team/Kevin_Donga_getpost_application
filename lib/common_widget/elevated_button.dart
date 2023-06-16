import 'package:flutter/material.dart';

Widget commonBottomLoginORSignUpButton(
    {required double leftPadding,
    required double rightPadding,
    required double topPadding,
    required double bottomPadding,
    required void Function()? onPressed,
    required String buttonText}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    ),
    child: Padding(
      padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding),
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Color(0xff0F3E1A),
            fontSize: 18,
            fontWeight: FontWeight.w800),
      ),
    ),
  );
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget commonTextField(
    {required double width,
    required double height,
    required TextEditingController controller,
    String? Function(dynamic val)? validator,
    Widget? suffixIcon,
    String? hintTextString}) {
  return SizedBox(
    width: width,
    height: height,
    child: DottedBorder(
      strokeWidth: 2,
      dashPattern: const [6, 3, 6, 3],
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: hintTextString,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

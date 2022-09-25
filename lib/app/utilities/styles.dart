import 'package:book_turf/app/utilities/colors.dart';
import 'package:flutter/material.dart';

const textFormTextStyle = TextStyle(
  color: Colors.black45,
  fontSize: 15,
);
const TextStyle textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final boxDecoration = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(30),
);

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(15),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
    );

const SizedBox height5 = SizedBox(height: 5);
const height10 = SizedBox(height: 10);
const height20 = SizedBox(height: 20);
const height30 = SizedBox(height: 30);
const height50 = SizedBox(height: 50);
const width5 = SizedBox(width: 5);
const width10 = SizedBox(width: 10);

import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SnackBarWidget {
  static chekFormFill(context, errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(20),
        backgroundColor: greyColor,
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            color: blackColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

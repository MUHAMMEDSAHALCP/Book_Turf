import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SnackBarWidget {
  static chekFormFill(context, errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(20),
        backgroundColor: primaryColor,
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            color: whiteColor,
            fontSize: 15,
          ),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            right: 10,
            left: 10),
      ),
    );
  }
}

class Messenger {
  static final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static pop({required String msg, Color? color}) {
    Size size =
        MediaQuery.of(rootScaffoldMessengerKey.currentState!.context).size;
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        margin: EdgeInsets.only(bottom: size.height - 130, right: 20, left: 20),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            msg,
            style: const TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

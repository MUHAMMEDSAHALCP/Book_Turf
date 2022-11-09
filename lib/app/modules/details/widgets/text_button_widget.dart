import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: boxDecoration.copyWith(color: secondaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: textStyle.copyWith(color: whiteColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

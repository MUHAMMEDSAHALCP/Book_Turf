import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class TurfTypeBar extends StatelessWidget {
  final String text;
  const TurfTypeBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Image(
            image: AssetImage("assets/images/3d_football.webp"),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(color: whiteColor),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Image(
            image: AssetImage("assets/images/3d_football.webp"),
          ),
        ),
      ],
    );
  }
}

import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class NoMoreBooking extends StatelessWidget {
  final String text;
  const NoMoreBooking({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      text,
        style: textStyle.copyWith(
          color: redColor,
          fontSize: 12,
        ),
      ),
    );
  }
}

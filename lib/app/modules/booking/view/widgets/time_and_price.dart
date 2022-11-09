import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class TimeAndPrice extends StatelessWidget {
  final String time;
  final String price;
  const TimeAndPrice({super.key, required this.time, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: textStyle.copyWith(fontSize: 18),
        ),
        Text(
          "₹ $price",
          style: textStyle.copyWith(color: redColor, fontSize: 15),
        ),
      ],
    );
  }
}

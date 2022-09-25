import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class TurfContainer extends StatelessWidget {
  final String turfName;

  final bool visible;
  const TurfContainer({Key? key, required this.visible, required this.turfName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration.copyWith(
        color: cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
          topLeft: Radius.circular(100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height10,
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/jawans.png"),
            ),
            Text(
              turfName,
              textAlign: TextAlign.center,
              style: textStyle.copyWith(fontSize: 16),
            ),
            height5,
            Text(
              "Kinavakkal Kut...",
              style: textStyle.copyWith(fontSize: 14, color: greyColor),
            ),
            height5,
            Text(
              "5km",
              style: textStyle.copyWith(fontSize: 14, color: greyColor),
            ),
            height10,
            Visibility(
              visible: visible,
              child: MaterialButtonWidget(
                height: 35,
                text: "Book",
                color: secondaryColor,
                textColor: whiteColor,
                onClick: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

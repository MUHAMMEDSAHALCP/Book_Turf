import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class StaticCard extends StatelessWidget {
  const StaticCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .18,
      decoration: boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Muhammed...",
                  style: textStyle.copyWith(
                    color: whiteColor,
                  ),
                ),
                height10,
                Text(
                  "Explore vanues and \n book your favourite spot.",
                  style: textStyle.copyWith(fontSize: 13),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
              height: size.height * .3,
              width: size.width / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/boyfootball.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
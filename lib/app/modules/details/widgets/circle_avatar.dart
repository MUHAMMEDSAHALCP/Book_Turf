import 'package:book_turf/app/utilities/colors.dart';
import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String networkImage;
  final double radius;
  final double borderRadius;
  const CircleAvatarWidget(
      {Key? key,
      required this.networkImage,
      required this.radius,
      required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircleAvatar(
        backgroundColor: secondaryColor,
        radius: borderRadius,
        child: CircleAvatar(
          backgroundColor: cardColor,
          backgroundImage: NetworkImage(
            networkImage,
          ),
          radius: radius,
        ),
      ),
    );
  }
}

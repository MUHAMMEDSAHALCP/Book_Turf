import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class TurfCardSkelton extends StatelessWidget {
  const TurfCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleSkelton(
          size: 120,
        ),
        height10,
        Skelton(
          width: 100,
        ),
        height5,
        Skelton(
          width: 100,
        ),
        height5,
        height10,
      ],
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius:
              const BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}

class CircleSkelton extends StatelessWidget {
  const CircleSkelton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
    );
  }
}

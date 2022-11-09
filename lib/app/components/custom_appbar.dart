import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool visible;
  final Function() favouriteOnClick;

  const CustomAppBar(
      {Key? key,
      required this.text,
      required this.visible,
      required this.favouriteOnClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        Text(
          text,
          style: textStyle.copyWith(fontSize: 25),
        ),
        const Spacer(),
        Visibility(
          visible: visible,
          child: IconButton(
            onPressed: favouriteOnClick,
            icon: const Icon(Icons.favorite_border),
          ),
        ),
      ],
    );
  }
}

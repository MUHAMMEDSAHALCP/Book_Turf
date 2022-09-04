import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function() onClick;
  const MaterialButtonWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          text,
          style: textStyle.copyWith(
            color: textColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

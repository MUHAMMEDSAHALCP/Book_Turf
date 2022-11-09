import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final String? amount;
  final String? doubleColon;
  final bool iconVisible;
  final bool doubleColonVisible;
  final bool amountVisible;
  final Color color;

  const IconAndText(
      {Key? key,
      required this.text,
      this.icon,
      this.amount,
      required this.iconVisible,
      this.doubleColon,
      required this.doubleColonVisible,
      required this.amountVisible,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: iconVisible,
          child: Icon(icon),
        ),
        width10,
        Flexible(
          child: FittedBox(
            child: Text(
              text.toString(),
              style: textStyle.copyWith(fontSize: 14),
            ),
          ),
        ),
        Visibility(
          visible: amountVisible,
          child: Flexible(
            child: FittedBox(
              child: Text(
                amount.toString(),
                style: textStyle.copyWith(fontSize: 14, color: color),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

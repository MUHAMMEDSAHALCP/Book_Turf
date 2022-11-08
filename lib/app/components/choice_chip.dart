import 'package:book_turf/app/utilities/colors.dart';
import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final bool selected;
  final Function(bool) onClick;
  final double? height;
  final double width;

  const ChoiceChipWidget({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.onClick,
    required this.selected,
    this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: primaryColor,
      label: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle.copyWith(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      selectedColor: secondaryColor,
      onSelected: onClick,
      selected: selected,
    );
  }
}

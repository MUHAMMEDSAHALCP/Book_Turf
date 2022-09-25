import 'package:book_turf/app/utilities/colors.dart';
import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final bool selected;
  final Function(bool) onClick;

  const ChoiceChipWidget({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.onClick,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChoiceChip(
      backgroundColor: secondaryColor,
      label: SizedBox(
        width: size.width / 10,
        height: size.height / 20,
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
      selectedColor: primaryColor,
      onSelected: onClick,
      selected: selected,
    );
  }
}

import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class StartEndTimeWidget extends StatelessWidget {
  final String text;
  final Function() onClick;
  const StartEndTimeWidget({
    required this.text,
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: textStyle.copyWith(fontSize: 15, color: blackColor),
                  ),
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: blackColor)
            ],
          ),
        ),
      ),
    );
  }
}

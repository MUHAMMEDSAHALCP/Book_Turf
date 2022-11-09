import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class AminitiesContainer extends StatelessWidget {
  final String text;
  final bool? visible;
  const AminitiesContainer({super.key, required this.text, this.visible});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Visibility(
        visible: text == "" ? false : true,
        child: Container(
          decoration: boxDecoration.copyWith(
            color: cardColor,
          ),
          height: 50,
          width: size.width / 3.6,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(Icons.check, size: 12),
                  width5,
                  Center(
                    child: Text(
                      text,
                      style: textStyle.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

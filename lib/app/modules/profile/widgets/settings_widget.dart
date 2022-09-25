import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class ReusableSettingContainer extends StatelessWidget {
  final String title;
  final Function() onClick;
  final IconData icon;
  const ReusableSettingContainer(
      {Key? key,
      required this.title,
      required this.onClick,
      required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Icon(icon),
            width10,
            Text(
              title,
              style: textStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

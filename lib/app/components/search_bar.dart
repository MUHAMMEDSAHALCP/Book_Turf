import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  const SearchBarWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: boxDecoration.copyWith(
          color: cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: textStyle.copyWith(color: Colors.black26, fontSize: 15),
              ),
              const Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}

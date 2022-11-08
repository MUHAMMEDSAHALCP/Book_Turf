import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  final Color color;
  final Color textColor;
  final double? height;
  final Function() onClick;
  final Widget? isLoading;
  const MaterialButtonWidget({
    Key? key,
    required this.color,
    required this.textColor,
    required this.onClick,
    this.height,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: MaterialButton(
        height: 50,
        onPressed: onClick,
        child: isLoading,
      ),
    );
  }
}

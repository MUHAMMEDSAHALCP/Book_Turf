import 'package:flutter/material.dart';

class SpotView extends StatelessWidget {
  static String id = "Spot_view";
  const SpotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Spot View ",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

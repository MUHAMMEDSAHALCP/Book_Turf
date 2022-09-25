import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  static String id = "Detials_view";
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Detrails View",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

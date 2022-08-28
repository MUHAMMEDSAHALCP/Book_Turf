import 'package:flutter/material.dart';

class  HomeView extends StatelessWidget {
  static String id = "Home_view";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "HomeView View ",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

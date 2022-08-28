import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  static String id = "signup_view";
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "sign In View ",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

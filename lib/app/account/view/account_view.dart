import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  static String id = "acount_view";
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Account View ",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

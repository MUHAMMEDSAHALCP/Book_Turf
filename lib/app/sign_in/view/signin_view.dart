import 'package:book_turf/app/utilities/styles/styles.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  static String id = "signin_page";
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "signIn",
              style: textStyle.copyWith(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

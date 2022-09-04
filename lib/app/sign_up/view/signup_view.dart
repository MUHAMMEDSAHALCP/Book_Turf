import 'package:book_turf/app/components/signin_container.dart';
import 'package:book_turf/app/sign_in/view/signin_view.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  static String id = "signup_view";
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height20,
                  Text(
                    "Register",
                    style: textStyle.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  height5,
                  Text(
                    "Please sign up to continue...",
                    style: textStyle.copyWith(
                      fontSize: 15,
                      color: greyColor,
                    ),
                  ),
                  height20,
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Name", style: textFormTextStyle),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        "Email",
                        style: textFormTextStyle,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        "Phone",
                        style: textFormTextStyle,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        "Password",
                        style: textFormTextStyle,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        "Confirm Password",
                        style: textFormTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height10,
            SignInContainer(
              buttonText: 'Sign up',
              buttonOnClick: () {},
              googleButtonText: 'Continue with google',
              googleButtonOnClick: () {},
              signUpSignInText: 'Sign In',
              signUpSignInOnClick: () {
                Navigator.pushNamed(context, SignInView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

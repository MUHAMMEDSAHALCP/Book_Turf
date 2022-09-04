import 'package:book_turf/app/components/signin_container.dart';
import 'package:book_turf/app/home/view/home_view.dart';
import 'package:book_turf/app/sign_up/view/signup_view.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  static String id = "signin_page";
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: size.height / 9.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height20,
                  Text(
                    "signIn",
                    style: textStyle.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  height5,
                  Text(
                    "Please sign in to continue...",
                    style: textStyle.copyWith(
                      fontSize: 15,
                      color: greyColor,
                    ),
                  ),
                  height50,
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Email", style: textFormTextStyle),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Password", style: textFormTextStyle),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: textFormTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SignInContainer(
              buttonText: 'Sign In',
              buttonOnClick: () {
                Navigator.pushReplacementNamed(context, HomeView.id);
              },
              googleButtonText: 'Continue with google',
              googleButtonOnClick: () {},
              signUpSignInText: 'Sign up',
              signUpSignInOnClick: () {
                Navigator.pushNamed(context, SignUpView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

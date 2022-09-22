import 'package:book_turf/app/components/signin_container.dart';
import 'package:book_turf/app/modules/sign_in/view_model/signin_view_model.dart';
import 'package:book_turf/app/modules/sign_up/view/signup_view.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  static String id = "signin_page";
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final signInViewModel = context.read<SignInViewModel>();
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: size.height / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "sign in",
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
                  height50,
                  TextFormField(
                    controller: signInViewModel.emailController,
                    decoration: const InputDecoration(
                      label: Text("Email", style: textFormTextStyle),
                    ),
                  ),
                  TextFormField(
                    controller: signInViewModel.passwordController,
                    decoration: const InputDecoration(
                      label: Text("Password", style: textFormTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: textFormTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
            SignInContainer(
              buttonText: 'Sign in',
              buttonOnClick: () {
                signInViewModel.signIn(context);
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

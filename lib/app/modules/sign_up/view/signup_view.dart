import 'package:book_turf/app/components/signin_container.dart';
import 'package:book_turf/app/modules/otp_verification/view/verification_view.dart';
import 'package:book_turf/app/modules/otp_verification/view_model/otp_view_model.dart';
import 'package:book_turf/app/modules/sign_in/view/signin_view.dart';
import 'package:book_turf/app/modules/sign_up/view_model/signup_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  static String id = "signup_view";
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final otpViewModel = context.read<OtpViewModel>();

    final signUpViewModel = context.read<SignUpViewModel>();
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: size.height / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  height50,
                  height20,
                  TextFormField(
                    controller: signUpViewModel.emailController,
                    decoration: const InputDecoration(
                      label: Text(
                        "Email",
                        style: textFormTextStyle,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: signUpViewModel.passwordController,
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
              buttonOnClick: () {
                signUpViewModel.signUp(context);
              },
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

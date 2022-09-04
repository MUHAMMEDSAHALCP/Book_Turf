import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SignInContainer extends StatelessWidget {
  final String buttonText;
  final String googleButtonText;
  final String signUpSignInText;
  final Function() signUpSignInOnClick;
  final Function() buttonOnClick;
  final Function() googleButtonOnClick;

  const SignInContainer({
    Key? key,
    required this.buttonText,
    required this.googleButtonText,
    required this.signUpSignInText,
    required this.signUpSignInOnClick,
    required this.buttonOnClick,
    required this.googleButtonOnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 3.1,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MaterialButtonWidget(
              color: secondaryColor,
              text: buttonText,
              textColor: whiteColor,
              onClick: buttonOnClick,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 30,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: signUpSignInOnClick,
                  child: Text(
                    signUpSignInText,
                    style: textFormTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: size.width / 2.6,
                    color: greyColor,
                  ),
                  width10,
                  const Text("OR"),
                  width10,
                  Container(
                    height: 1,
                    width: size.width / 2.6,
                    color: greyColor,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Stack(
                children: [
                  MaterialButtonWidget(
                    color: whiteColor,
                    text: googleButtonText,
                    textColor: blackColor,
                    onClick: googleButtonOnClick,
                  ),
                  const Positioned(
                    top: 4,
                    left: 4,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/google.webp"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class SignInContainer extends StatelessWidget {
  final String googleButtonText;
  final String signUpSignInText;
  final Function() signUpSignInOnClick;
  final Function() buttonOnClick;
  final Function() googleOnClick;
  final Function() phoneOnClick;
  final Widget? isLoading;

  const SignInContainer({
    Key? key,
    required this.googleButtonText,
    required this.signUpSignInText,
    required this.signUpSignInOnClick,
    required this.buttonOnClick,
    required this.googleOnClick,
    required this.phoneOnClick,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 2.2,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          children: [
            MaterialButtonWidget(
              isLoading: isLoading,
              color: secondaryColor,
              textColor: whiteColor,
              onClick: buttonOnClick,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: signUpSignInOnClick,
                  child: FittedBox(
                    child: Text(
                      signUpSignInText,
                      style: textFormTextStyle.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: size.width / 3,
                    color: greyColor,
                  ),
                  width10,
                  const Text("OR"),
                  width10,
                  Container(
                    height: 1,
                    width: size.width / 3,
                    color: greyColor,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: googleOnClick,
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/google.png"),
                    ),
                  ),
                  width10,
                  width10,
                  GestureDetector(
                    onTap: phoneOnClick,
                    child: const CircleAvatar(
                      radius: 25,
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 21,
                        backgroundImage: AssetImage(
                          "assets/images/phone.jpg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

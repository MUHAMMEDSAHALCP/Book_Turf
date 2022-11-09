import 'package:book_turf/app/components/signin_container.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/phone_signin.dart/view/phone_view.dart';
import 'package:book_turf/app/modules/sign_in/view/signin_view.dart';
import 'package:book_turf/app/modules/sign_up/view_model/signup_view_model.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  static String id = "signup_view";
  SignUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final signUpViewModel = context.read<SignUpViewModel>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: size.height / 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
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
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, BottomNavView.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavView(),
                                ),
                              );
                            },
                            child: const Text(
                              "Guest",
                              style: textStyle,
                            ),
                          )
                        ],
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: signUpViewModel.passwordController,
                        decoration: const InputDecoration(
                          label: Text(
                            "Password",
                            style: textFormTextStyle,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: signUpViewModel.confirmPasswordController,
                        decoration: const InputDecoration(
                          label: Text(
                            "Confirm Password",
                            style: textFormTextStyle,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm password.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              height10,
              SignInContainer(
                isLoading: context.watch<SignUpViewModel>().isLoading == true
                    ? const CupertinoActivityIndicator(
                        radius: 15,
                        color: whiteColor,
                      )
                    : Text(
                        "Sign up",
                        style: textStyle.copyWith(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                buttonOnClick: () {
                  if (_formKey.currentState!.validate()) {
                    signUpViewModel.signUp(context);
                  }
                },
                googleButtonText: 'Continue with google',
                googleOnClick: () {},
                signUpSignInText: 'Sign In',
                signUpSignInOnClick: () {
                  Navigations.push(SignInView());
                },
                phoneOnClick: () {
                  Navigations.push(const PhoneView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

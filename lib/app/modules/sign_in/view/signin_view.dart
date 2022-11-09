import 'package:book_turf/app/components/signin_container.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/phone_signin.dart/view/phone_view.dart';
import 'package:book_turf/app/modules/sign_in/view_model/signin_view_model.dart';
import 'package:book_turf/app/modules/sign_up/view/signup_view.dart';
import 'package:book_turf/app/modules/sign_up/view_model/signup_view_model.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  static String id = "signin_page";
  SignInView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final signInViewModel = context.read<SignInViewModel>();
    return SafeArea(
      child: Scaffold(
        body: LimitedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: size.height / 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "sign in",
                                  style: textStyle.copyWith(
                                    fontSize: 30,
                                  ),
                                ),
                                height5,
                                FittedBox(
                                  child: Text(
                                    "Please sign in to continue",
                                    style: textStyle.copyWith(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      color: greyColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            FittedBox(
                              child: TextButton(
                                  onPressed: () {
                                    Navigations.push(const BottomNavView());
                                  },
                                  child: const Text(
                                    "Guest",
                                    style: textStyle,
                                  )),
                            )
                          ],
                        ),
                        height50,
                        height50,
                        TextFormField(
                          controller: signInViewModel.emailController,
                          decoration: const InputDecoration(
                            label: Text("Email", style: textFormTextStyle),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: signInViewModel.passwordController,
                          decoration: const InputDecoration(
                            label: Text("Password", style: textFormTextStyle),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SignInContainer(
                  buttonOnClick: () {
                    if (_formKey.currentState!.validate()) {
                      signInViewModel.signIn(context);
                    }
                  },
                  isLoading: context.watch<SignInViewModel>().isLoading == false
                      ? FittedBox(
                          child: Text(
                            "Sign in",
                            style: textStyle.copyWith(
                              color: whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const CupertinoActivityIndicator(
                          radius: 15,
                          color: whiteColor,
                        ),
                  googleButtonText: 'Continue with google',
                  googleOnClick: () {},
                  signUpSignInText: 'Sign up',
                  signUpSignInOnClick: () {
                    signInViewModel.disposeData();
                    context.read<SignUpViewModel>().disposeData();
                    Navigations.push(
                      SignUpView(),
                    );
                  },
                  phoneOnClick: () {
                    Navigations.push(const PhoneView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

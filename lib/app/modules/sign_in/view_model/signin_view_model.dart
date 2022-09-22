import 'dart:developer';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/sign_in/model/sign_in_model.dart';
import 'package:book_turf/app/modules/sign_in/signin_service.dart/signin_api_service.dart';
import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<dynamic> signIn(context) async {
    SigninModel data = SigninModel(
        userMail: emailController.text.toString(),
        userPassword: passwordController.text.toString());
    SignInResponse signUpResponse = await SignInApiService().signinApi(data);
    if (signUpResponse.status == true) {
      Navigator.pushReplacementNamed(context, BottomNavView.id);
    } else {
      log("no data");
    }
  }
}

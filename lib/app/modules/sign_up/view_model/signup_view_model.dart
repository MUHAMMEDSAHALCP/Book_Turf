import 'dart:developer';
import 'package:book_turf/app/modules/otp_verification/view/verification_view.dart';
import 'package:book_turf/app/modules/sign_up/model/signup_model.dart';
import 'package:book_turf/app/modules/sign_up/signup_service/sign/signup_api_service.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? newID;

  signUp(context) async {
    final SignUpModel data = SignUpModel(
      userMail: emailController.text.toString(),
      userPassword: passwordController.text.toString(),
    );
    SignUpResponse signUpResponse = await SignupApiService().signupApi(data);
    newID = signUpResponse.id;
    if (signUpResponse.status == true) {
      Navigator.pushReplacementNamed(context, OtpVerificationView.id);
    } else {
      log("no data");
    }
  }
}

import 'dart:developer';

import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/email_otp/view/verification_view.dart';
import 'package:book_turf/app/modules/sign_up/model/signup_model.dart';
import 'package:book_turf/app/modules/sign_up/service/signup_api_service.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpViewModel extends ChangeNotifier {
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  String? newID;
  String? email;

  signUp(context) async {
    isLoading = true;
    notifyListeners();
    email = emailController.text.toString();
    String passWord = passwordController.text.toString();
    final SignUpModel data = SignUpModel(
      userMail: email.toString(),
      userPassword: passWord,
    );
    if (passwordController.text == confirmPasswordController.text) {
      SignUpResponse? signUpResponse = await SignupApiService().signupApi(data);
      log(signUpResponse!.id.toString());
      if (signUpResponse.error == true) {
        newID = signUpResponse.id;
        secureStorage.write(key: "_id", value: newID);
        Navigations.push(const OtpVerificationView());
        isLoading = false;
        notifyListeners();
      } else {
        SnackBarWidget.chekFormFill(context, signUpResponse.message);
        isLoading = false;
        notifyListeners();
      }
    } else {
      SnackBarWidget.chekFormFill(context, "Confirm password isn't match!!!");
    }
  }

  disposeData() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}

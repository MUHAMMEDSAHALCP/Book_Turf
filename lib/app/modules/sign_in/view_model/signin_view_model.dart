import 'dart:developer';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/sign_in/model/sign_in_model.dart';
import 'package:book_turf/app/services/dio_service.dart';
import 'package:book_turf/app/services/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<dynamic> signIn(context) async {
    final userData = SigninModel(
        userMail: nameController.text.toString(),
        userPassword: passwordController.text.toString());

    try {
      Response response = await DioService.postMethod(
          url: Url.baseUrl + Url.login, value: userData.toJson());
      log(response.data);
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, BottomNavView.id);
      }
    } on DioError catch (e) {
      log(e.message);
    } catch (e) {
      log("Sign In error message:$e");
    }
  }
}

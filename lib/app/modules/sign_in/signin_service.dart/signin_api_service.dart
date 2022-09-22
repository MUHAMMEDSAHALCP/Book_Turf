import 'dart:developer';

import 'package:book_turf/app/modules/sign_in/model/sign_in_model.dart';
import 'package:book_turf/app/modules/sign_up/model/signup_model.dart';
import 'package:book_turf/app/services/dio_service.dart';
import 'package:book_turf/app/services/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SignInApiService {
  signinApi(SigninModel data) async {
    try {
      Response response = await DioService.postMethod(
          url: Url.baseUrl + Url.login, value: data.toJson());

      if (response.statusCode == 200) {
        SignInResponse newData = SignInResponse.fromJson(response.data);
        if (kDebugMode) {
          print(newData);
        }
        return newData;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return SignUpResponse.fromJson(e.response!.data);
      }
    } catch (e) {
      log("SignIn error message: $e");
    }
  }
}

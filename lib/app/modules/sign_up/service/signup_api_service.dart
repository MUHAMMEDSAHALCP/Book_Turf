import 'dart:developer';

import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/modules/sign_up/model/signup_model.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SignupApiService extends ChangeNotifier {
  Future<SignUpResponse?> signupApi(SignUpModel data) async {
    bool network = await checking();
    if (network == true) {
      Dio dio = Dio();
      try {
        Response response =
            await dio.post(Url.baseUrl + Url.signup, data: data.toJson());
        log("=====================================");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return SignUpResponse.fromJson(response.data);
        }
      } catch (e) {
        return SignUpResponse(error: true, message: handleError(e));
      }
    } else {
      return SignUpResponse(
          error: true, message: "Please check your internet connection");
    }
    return null;
  }
}

import 'dart:developer';
import 'package:book_turf/app/modules/sign_up/model/signup_model.dart';
import 'package:book_turf/app/utilities/core/dio_service.dart';
import 'package:book_turf/app/utilities/core/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SignupApiService extends ChangeNotifier {
 Future<SignUpResponse?> signupApi(SignUpModel data) async {
    try {
      Response response = await DioService.postMethod(
          url: Url.baseUrl + Url.signup, value: data.toJson());

      if (response.statusCode == 200) {
        SignUpResponse newData = SignUpResponse.fromJson(response.data);
        if (kDebugMode) {
          print(newData.id);
        }
        return newData;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return SignUpResponse.fromJson(e.response!.data);
      }
    } catch (e) {
      log("SignUp error message: $e");
    }
    return null;
  }
}

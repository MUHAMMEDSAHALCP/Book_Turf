import 'dart:developer';
import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/utilities/dio_service.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class EmailOtpApi {
  emailOtpApi(newdata) async {
    try {
      Response response = await DioService.postMethod(
        url: Url.baseUrl + Url.otp,
        value: newdata.toJson(),
      );
      print(" datas :${response.data}");
      if (response.statusCode == 200) {
        return OtpModelResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("Dio Error message: ${e.error}");
      return OtpModelResponse.fromJson(e.response!.data);
    } catch (e) {
      log("Verify otp error message: $e");
    }
  }
}

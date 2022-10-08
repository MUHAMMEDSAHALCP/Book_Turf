import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/utilities/dio_service.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class EmailOtpApi {
  Future<EmailOtpModelResponse?> emailOtpApi(newdata) async {
    try {
      Response response = await DioService.postMethod(
        url: Url.baseUrl + Url.emailOtp,
        value: newdata.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailOtpModelResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return EmailOtpModelResponse(error: true, message: "Service error");
      } else if (e.type == DioErrorType.connectTimeout) {
        return EmailOtpModelResponse(
            error: true, message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return EmailOtpModelResponse(
            error: true, message: "Unable to connect to the server");
      } else if (e.type == DioErrorType.other) {
        return EmailOtpModelResponse(error: true, message: "No Internet");
      }
    } catch (e) {
      return EmailOtpModelResponse(error: true, message: "$e");
    }
    return EmailOtpModelResponse(error: true, message: "Restart Application");
  }
}

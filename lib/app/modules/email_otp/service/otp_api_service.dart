import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class EmailOtpApi {
  Future<EmailOtpModelResponse?> emailOtpApi(EmailOtpModel newdata) async {
    bool network = await checking();
    if (network) {
      Dio dio = Dio();
      try {
        Response response =
            await dio.post(Url.baseUrl + Url.emailOtp, data: newdata.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return EmailOtpModelResponse.fromJson(response.data);
        }
      } catch (e) {
        return EmailOtpModelResponse(error: false, message: handleError(e));
      }
    } else {
      return EmailOtpModelResponse(
          error: false, message: "Please check your internet !!!");
    }

    return null;
  }
}

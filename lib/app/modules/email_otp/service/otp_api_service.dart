import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/modules/interceptor/services/intercepter_service.dart';
import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class EmailOtpApi {
  Future<EmailOtpModelResponse?> emailOtpApi(newdata) async {
    Dio dio = HelperIntercepter().getApiClient() as Dio;

    try {
      Response response =
          await dio.post(Url.baseUrl + Url.signup, data: newdata.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailOtpModelResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      errorHandler(e);
    } catch (e) {
      return EmailOtpModelResponse(status: true, message: "$e");
    }
    return EmailOtpModelResponse(status: true, message: "Restart Application");
  }
}

import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/modules/phone_otp/model/phone_otp_model.dart';
import 'package:book_turf/app/utilities/dio_service.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class PhoneOtpApiService {
  Future<PhoneOtpModelResponse?> phoneOtpApi(data) async {
    try {
      Response response = await DioService.postMethod(
          url: Url.baseUrl + Url.phoneOtp, value: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return PhoneOtpModelResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      PhoneOtpModelResponse(error: true, message: handleError(e));
    } catch (e) {
      return PhoneOtpModelResponse(error: true, message: "$e");
    }
    return PhoneOtpModelResponse(error: true, message: "Restart Application");
  }
}

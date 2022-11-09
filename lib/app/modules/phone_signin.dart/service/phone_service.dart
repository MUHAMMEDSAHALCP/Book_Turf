import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/modules/phone_signin.dart/model/phone_model.dart';
import 'package:book_turf/app/utilities/dio_service.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class PhoneApiService {
  Future<PhoneModelResponse?> phoneApi(data) async {
    try {
      Response response = await DioService.postMethod(
          url: Url.baseUrl + Url.phoneSignIn, value: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return PhoneModelResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      PhoneModelResponse(error: true, message: handleError(e));
    } catch (e) {
      return PhoneModelResponse(error: true, message: "$e");
    }
    return PhoneModelResponse(error: true, message: "Restart Application");
  }
}

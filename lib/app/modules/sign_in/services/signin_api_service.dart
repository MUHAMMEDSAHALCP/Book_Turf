import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/modules/sign_in/model/sign_in_model.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class SignInApiService {
  Future<SignInResponse?> signinApi(SigninModel data) async {
    bool network = await checking();
    if (network) {
      Dio dio = Dio();
      try {
        Response response =
            await dio.post(Url.baseUrl + Url.login, data: data.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return SignInResponse.fromJson(response.data);
        }
      } catch (e) {
        return SignInResponse(error: false, message: handleError(e));
      }
    } else {
      return SignInResponse(
          error: false, message: "Please check your internet !!!");
    }
    return null;
  }
}

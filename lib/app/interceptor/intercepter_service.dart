import 'dart:developer';
import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HelperIntercepter {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<Dio> getApiClient() async {
    Dio dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await getToken();

      dio.interceptors.clear();
      print('token is : $token');
      log(token);

      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (e, handler) async {
      if (e.response?.statusCode == 403) {
        final refreshToken = await getRefreshToken();
        log(refreshToken.toString());

        try {
          await dio.post(
              "https://bookturf123.herokuapp.com/account/refresh-token",
              data: {
                "refreshToken": refreshToken,
              }).then((value) async {
            if (value.statusCode == 200) {
              final obj = EmailOtpModelResponse.fromJson(value.data);
              //get new tokens ...
              print("new token---->${obj.token}");
              await addToSecureStorage(value.data['token']);
              //set bearer
              e.requestOptions.headers.addAll({
                "Authorization": "${obj.token}",
              });
              //create request with new access token
              final opts = Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers);
              final cloneReq = await dio.request(e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters);

              return handler.resolve(cloneReq);
            }
            return handler.next(e);
          });
        } catch (e) {
          log(e.toString());
        }
      }
    }));
    return dio;
  }

  Future<void> addToSecureStorage(value) async {
    await secureStorage.write(
      key: "Token",
      value: value.token,
    );
    log('added to secure storage');
  }

  Future<String> getToken() async {
    return await secureStorage.read(key: "Token") ?? "";
  }

  Future<String> getRefreshToken() async {
    return await secureStorage.read(key: "refreshToken") ?? "";
  }
}

import 'package:dio/dio.dart';

class DioService {
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    return await Dio().post(url, data: value).then((value) => value);
  }

  static Future<dynamic> getMethod({required String url}) async {
    return await Dio().get(url).then((value) => value);
  }
}

import 'dart:io';

import 'package:dio/dio.dart';

String handleError(e) {
  String defaultApiError = 'Something went wrong!';
  String networkError = 'No connection';

  if (e is DioError) {
    if (e.response == null) {
      return networkError;
    } else if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return networkError;
    } else if (e.type == DioErrorType.response) {
      if (e.response!.statusCode == 401) {
        return e.response?.data["message"];
      } else {
        return defaultApiError;
      }
    }
  }
  return defaultApiError;
}

Future<bool> checking() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  } on SocketException catch (_) {
    return false;
  }
}

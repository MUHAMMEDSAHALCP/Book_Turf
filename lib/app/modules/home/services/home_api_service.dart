import 'dart:developer';

import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/home/model/location_model.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/interceptor/intercepter_service.dart';
import 'package:dio/dio.dart';

class HomeApiService {
  Future<TurfNearestData> getHomeTurfdata() async {
    Dio dio = await HelperIntercepter().getApiClient();

    UserLocationModel? userLoction = await GetUserLoction().getUserLocation();

    try {
      Response response = await dio.get(
          "https://bookturf123.herokuapp.com/user/nearest-turf/${userLoction?.features!.first.context![1].text}");
      log(" Truf response:${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return TurfNearestData.fromJson(response.data);
      }
    } on DioError catch (e) {
      // return errorHandler(e);
      if (e.response?.statusCode == 401) {
        return TurfNearestData(error: true, message: "Service error");
      } else if (e.type == DioErrorType.connectTimeout) {
        return TurfNearestData(error: true, message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return TurfNearestData(
            error: true, message: "Unable to connect to the server");
      } else if (e.type == DioErrorType.other) {
        return TurfNearestData(
            error: true, message: "Oops... Something went wrong!!!");
      }
    } catch (e) {
      return TurfNearestData(error: true, message: "$e");
    }
    return TurfNearestData(
        error: true, message: " Oops... Something went wrong!!!");
  }
}

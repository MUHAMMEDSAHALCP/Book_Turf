import 'dart:developer';
import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/home/model/location_model.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/interceptor/intercepter_service.dart';
import 'package:dio/dio.dart';

class HomeApiService {
  Future<TurfNearestData?> getHomeTurfdata() async {
    bool network = await checking();
    if (network) {
      Dio dio = await HelperIntercepter().getApiClient();
      UserLocationModel? userLoction = await GetUserLoction().getUserLocation();
      try {
        Response response = await dio.get(
            "https://bookturf123.herokuapp.com/user/nearest-turf/${userLoction?.features!.first.context![1].text}");
        log(" Truf response:${response.data}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return TurfNearestData.fromJson(response.data);
        }
      } catch (e) {
        return TurfNearestData(error: false, message: handleError(e));
      }
    } else {
      return TurfNearestData(
          error: false, message: "Please check your internet connection !!!");
    }
    return null;
  }
}

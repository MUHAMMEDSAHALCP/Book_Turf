import 'dart:developer';

import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/interceptor/intercepter_service.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavouriteApiService {
  Future<TurfNearestData?> favouriteApi(context, TurfNearestData data) async {
    log("Add to dfkmldfslk");
    bool network = await checking();
    if (network) {
      Dio dio = await HelperIntercepter().getApiClient();
      try {
        log("trieddddd");
        Response response = await dio.post(
            "https://bookturf123.herokuapp.com/user/add-wishlist",
            data: data.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          // return TurfNearestData.fromJson(response.data);
          SnackBarWidget.chekFormFill(context, "Added to favorite");
        }
      } catch (e) {
        if (e is DioError) {
          log(e.response!.data.toString());
        } else {
          log("its not dio error");
        }
      }
    } else {
      return TurfNearestData(
          error: true, message: "Please check internet connection !!!");
    }
    return null;
  }

  Future<TurfNearestData?> fetchFavorite(context) async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    String? userId = await secureStorage.read(key: '_id');
    log("favorite$userId");
    Dio dio = await HelperIntercepter().getApiClient();
    try {
      Response response = await dio
          .get("https://bookturf123.herokuapp.com/user/get-wishlist/$userId");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return TurfNearestData.fromJson(response.data);
      }
    } catch (e) {
      print("fkjngsdfgnj");
      return TurfNearestData(error: false, message: handleError(e));
    }
    return TurfNearestData(
        status: true, message: " Oops... Something went wrong!!!");
  }
}

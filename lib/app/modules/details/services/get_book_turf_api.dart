import 'dart:developer';
import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/interceptor/intercepter_service.dart';
import 'package:book_turf/app/modules/details/model/book_view_model.dart';
import 'package:dio/dio.dart';

class GetBookTurfApi {
  Future<GetBookTurfModel?> getBookTurfApi(turfId) async {
    bool network = await checking();
    if (network) {
      Dio dio = await HelperIntercepter().getApiClient();
      log(turfId.toString());
      try {
        Response response = await dio.get(
            "https://bookturf123.herokuapp.com/account/get-booking/$turfId");

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return GetBookTurfModel.fromJson(response.data);
        }
      } catch (e) {
        return GetBookTurfModel(error: false, message: handleError(e));
      }
    } else {
      return GetBookTurfModel(
          error: false, message: "Please check your internet connection !!!");
    }
    return null;
  }
}

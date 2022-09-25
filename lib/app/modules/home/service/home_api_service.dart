import 'dart:developer';

import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/utilities/dio_service.dart';
import 'package:dio/dio.dart';

class HomeApiService {
  getTurfdata() async {
    try {
      Response response = await DioService.getMethod();
      if (response.statusCode == 200) {
        return HomeTurfModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return HomeTurfModel.fromJson(e.response!.data);
    } catch (e) {
      log("Home api error meassage: $e");
    }
  }
}

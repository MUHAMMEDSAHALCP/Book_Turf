import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/utilities/dio_service.dart';
import 'package:book_turf/app/utilities/url.dart';
import 'package:dio/dio.dart';

class HomeApiService {
  Future<HomeTurfModel?> getTurfdata() async {
    try {
      Response response =
          await DioService.getMethod(url: Url.baseUrl + Url.getTurf);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return HomeTurfModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return HomeTurfModel(error: true, message: "Service error");
      } else if (e.type == DioErrorType.connectTimeout) {
        return HomeTurfModel(error: true, message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return HomeTurfModel(
            error: true, message: "Unable to connect to the server");
      } else if (e.type == DioErrorType.other) {
        return HomeTurfModel(
            error: true, message: "No Internet, check your connection!!!");
      }
    } catch (e) {
      return HomeTurfModel(error: true, message: "$e");
    }
    return HomeTurfModel(error: true, message: "Restart Application");
  }
}

import 'package:book_turf/app/interceptor/intercepter_service.dart';
import 'package:book_turf/app/modules/booking/model/booking_model.dart';
import 'package:dio/dio.dart';

class BookingAPiService {
  Future<BookingTurfModelResponse> bookingApi(BookingTurfModel data) async {
    Dio dio = await HelperIntercepter().getApiClient();

    Response response = await dio.post(
        "https://bookturf123.herokuapp.com/account/add-booking",
        data: data.toJson());

    if (response.statusCode == 200) {
      return BookingTurfModelResponse.fromJson(response.data);
    }
    return BookingTurfModelResponse.fromJson(response.data);
  }
}

import 'dart:developer';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/otp_verification/model/otp_verification_model.dart';
import 'package:book_turf/app/services/dio_service.dart';
import 'package:book_turf/app/services/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class OtpViewModel extends ChangeNotifier {
  final one = TextEditingController();
  final two = TextEditingController();
  final three = TextEditingController();
  final four = TextEditingController();

  void verifyOtp(
    context,
    id,
  ) async {
    final otp = {one.text + two.text + three.text + four.text};
    final codeQ = otp.join().toString();

    if (kDebugMode) {
      print(" newId : $id");
      print(" newId : $codeQ");
    }

    OtpModel newdata = OtpModel(
      id: id,
      userOtp: codeQ,
    );
    try {
      Response response = await DioService.postMethod(
        url: Url.baseUrl + Url.otp,
        value: newdata.toJson(),
      );
      if (kDebugMode) {
        print(" newIdefuwheifugh : $id");
      }
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, BottomNavView.id);
      }
    } on DioError catch (e) {
      log("Dio Error message: ${e.error}");
    } catch (e) {
      log("Verify otp error message: $e");
    }
  }
}

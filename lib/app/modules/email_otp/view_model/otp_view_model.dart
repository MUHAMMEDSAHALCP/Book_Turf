import 'dart:developer';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/modules/email_otp/service/otp_api_service.dart';
import 'package:flutter/cupertino.dart';

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

    OtpModel newdata = OtpModel(
      id: id,
      userOtp: codeQ,
    );

    OtpModelResponse result = await EmailOtpApi().emailOtpApi(newdata);
    print(result.status);

    if (result.status) {
      Navigator.pushNamedAndRemoveUntil(
          context, BottomNavView.id, (route) => false);
    } else {
      log("no data");
    }
  }
}

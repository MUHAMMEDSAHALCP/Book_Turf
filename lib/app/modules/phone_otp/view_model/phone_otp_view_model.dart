import 'dart:developer';
import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/phone_otp/model/phone_otp_model.dart';
import 'package:book_turf/app/modules/phone_otp/services/phone_otp_service.dart';
import 'package:flutter/cupertino.dart';

class PhoneOtpViewModel extends ChangeNotifier {
  TextEditingController phoneOtpController = TextEditingController();

  phoneSignIn(context, number, id) async {
    String otp = phoneOtpController.text.toString();
    log(number.toString());
    PhoneOtpModel data = PhoneOtpModel(
      userNumber: number,
      id: id,
      userOtp: otp,
    );
    PhoneOtpModelResponse? result =
        await PhoneOtpApiService().phoneOtpApi(data.toJson());

    if (result != null) {
      if (result.status == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, BottomNavView.id, (route) => false);
        SnackBarWidget.chekFormFill(context, "Successfully Signed In");
      } else {
        SnackBarWidget.chekFormFill(context, "something went wrong!!!");
      }
    } else {
      SnackBarWidget.chekFormFill(context, "Network connection issue!!!");
    }
  }
}

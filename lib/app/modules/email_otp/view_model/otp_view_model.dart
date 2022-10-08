import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/modules/email_otp/service/otp_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    EmailOtpModel newdata = EmailOtpModel(
      id: id,
      userOtp: codeQ,
    );

    EmailOtpModelResponse? result = await EmailOtpApi().emailOtpApi(newdata);
    if (result != null) {
      if (result.status == true) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool("keyValue", true);
        Navigator.pushReplacementNamed(context, BottomNavView.id);
        SnackBarWidget.chekFormFill(context, "Successfully Signed In");
      } else {
        SnackBarWidget.chekFormFill(context, result.message);
      }
    } else {
      SnackBarWidget.chekFormFill(context, "Network connection issue!!!");
    }
  }
}

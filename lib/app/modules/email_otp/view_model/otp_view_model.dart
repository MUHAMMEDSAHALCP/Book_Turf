import 'dart:developer';
import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/email_otp/model/otp_verification_model.dart';
import 'package:book_turf/app/modules/email_otp/service/otp_api_service.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpViewModel extends ChangeNotifier {
  final one = TextEditingController();
  final two = TextEditingController();
  final three = TextEditingController();
  final four = TextEditingController();
  bool isLoading = false;
  void verifyOtp(context, id) async {
    isLoading = true;
    notifyListeners();
    final otp = {one.text + two.text + three.text + four.text};
    final codeQ = otp.join().toString();
    EmailOtpModel newdata = EmailOtpModel(
      id: id,
      userOtp: codeQ,
    );
    EmailOtpModelResponse? result = await EmailOtpApi().emailOtpApi(newdata);
    log("token: ${result!.token}");
    log("refresh token: ${result.refreshToken}");
    if (result.error == true) {
      getToken(result);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool("keyValue", true);
      Navigations.pushReplace(const BottomNavView());
      SnackBarWidget.chekFormFill(context, "Successfully Signed In");
      Provider.of<GetUserLoction>(context, listen: false).getUserLocation();
      Provider.of<HomeViewModel>(context, listen: false)
          .getTurfDetails(context);
      disposeData();
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      SnackBarWidget.chekFormFill(context, result.message);
    }
  }

  disposeData() {
    one.clear();
    two.clear();
    three.clear();
    four.clear();
  }
}

FlutterSecureStorage secureStorage = const FlutterSecureStorage();
getToken(EmailOtpModelResponse value) async {
  await secureStorage.write(key: 'Token', value: value.token);
  await secureStorage.write(key: 'refreshToken', value: value.refreshToken);
  await secureStorage.write(key: 'loginTrue', value: 'true');
}

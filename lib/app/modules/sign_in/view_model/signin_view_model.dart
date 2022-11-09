import 'dart:developer';
import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/modules/sign_in/model/sign_in_model.dart';
import 'package:book_turf/app/modules/sign_in/services/signin_api_service.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel extends ChangeNotifier {
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<dynamic> signIn(context) async {
    isLoading = true;
    notifyListeners();
    SigninModel data = SigninModel(
        userMail: emailController.text.toString(),
        userPassword: passwordController.text.toString());
    SignInResponse? result = await SignInApiService().signinApi(data);
    log(" token: ${result!.token}");
    log("refresh token: ${result.refreshToken}");
    if (result.error == true) {
      log("================================== id: ${result.id}");
      getToken(result);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool("keyValue", true);
      Navigations.push(const BottomNavView());
      SnackBarWidget.chekFormFill(context, "Successfully Signed In");
      Provider.of<GetUserLoction>(context, listen: false)
          .getUserLocation();
      Provider.of<HomeViewModel>(context, listen: false)
          .getTurfDetails(context);
      isLoading = false;
      notifyListeners();
    } else {
      log("++++++++++++++++++++++++++++");
      log(result.message.toString());
      isLoading = false;
      notifyListeners();
      SnackBarWidget.chekFormFill(context, result.message);
    }
  }

  disposeData() {
    emailController.clear();
    passwordController.clear();
  }
}

FlutterSecureStorage secureStorage = const FlutterSecureStorage();
getToken(SignInResponse value) async {
  await secureStorage.write(key: 'Token', value: value.token);
  await secureStorage.write(key: 'refreshToken', value: value.refreshToken);
  await secureStorage.write(key: 'loginTrue', value: 'true');
  await secureStorage.write(key: '_id', value: value.id);
}

import 'dart:async';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/modules/sign_in/view/signin_view.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatelessWidget {
  static String id = "splash view";
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 3),
        () => checkLogIn(context),
      );
    });
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Image.asset(
            "assets/images/bt-logo.png",
          ),
        ),
      ),
    );
  }

  void checkLogIn(context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPreferences.getBool("keyValue") ?? false;
    if (userLoggedIn != true) {
      Navigations.pushReplace(SignInView());
    } else {
      Provider.of<GetUserLoction>(context, listen: false).getUserLocation();
      Provider.of<HomeViewModel>(context, listen: false)
          .getTurfDetails(context);
      Navigations.pushReplace(const BottomNavView());
    }
  }
}

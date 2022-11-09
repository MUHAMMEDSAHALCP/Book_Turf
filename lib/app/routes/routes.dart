// import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
// import 'package:book_turf/app/modules/email_otp/view/verification_view.dart';
// import 'package:book_turf/app/modules/home/view/home_view.dart';
// import 'package:book_turf/app/modules/profile/components/my_favourite/view/my_favourite.dart';
// import 'package:book_turf/app/modules/search/view/search_view.dart';
// import 'package:book_turf/app/modules/phone_otp/view/phone_otp_view.dart';
// import 'package:book_turf/app/modules/phone_signin.dart/view/phone_view.dart';
// import 'package:book_turf/app/modules/profile/view/profile_view.dart';
// import 'package:book_turf/app/modules/sign_in/view/signin_view.dart';
// import 'package:book_turf/app/modules/sign_up/view/signup_view.dart';
// import 'package:book_turf/app/modules/splash/view/splash_view.dart';
// import 'package:book_turf/app/modules/spot/view/spot_view.dart';

// class Routes {
//   static var routes = {
//     '/': (context) => const SplashView(),
//     SplashView.id: (context) => const SplashView(),
//     OtpVerificationView.id: (context) => const OtpVerificationView(),
//     BottomNavView.id: (context) => const BottomNavView(),
//     SignInView.id: (context) => SignInView(),
//     SignUpView.id: (context) => SignUpView(),
//     PhoneView.id: (context) => const PhoneView(),
//     PhoneOtpView.id: (context) => const PhoneOtpView(),
//     HomeView.id: (context) => const HomeView(),
//     SpotView.id: (context) => const SpotView(),
//     ProfileView.id: (context) => const ProfileView(),
//     SearchView.id: (context) => const SearchView(),
    // MyFavourites.id: (context) => const MyFavourites(),
//   };
// }
import 'package:flutter/material.dart';

class Navigations {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static push(page) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static pop() {
    navigatorKey.currentState?.pop();
  }

  static pushReplace(page) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static pushRemoveUntil(page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/modules/email_otp/view_model/otp_view_model.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/modules/phone_otp/view_model/phone_otp_view_model.dart';
import 'package:book_turf/app/modules/profile/view_model/profile_view_model.dart';
import 'package:book_turf/app/modules/sign_in/view_model/signin_view_model.dart';
import 'package:book_turf/app/modules/sign_up/service/services/signup_api_service.dart';
import 'package:book_turf/app/modules/sign_up/view_model/signup_view_model.dart';
import 'package:book_turf/app/modules/signin_phone/view_model/phone_view_model.dart';
import 'package:book_turf/app/modules/spot/view_model/spot_view_model.dart';
import 'package:book_turf/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Providers {
  static Widget provider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneOtpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpotViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetUserLoction(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

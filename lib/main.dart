import 'package:book_turf/app/account/view/account_view.dart';
import 'package:book_turf/app/booking/view/booking_view.dart';
import 'package:book_turf/app/checkout/view/checkout_view.dart';
import 'package:book_turf/app/details/view/details_view.dart';
import 'package:book_turf/app/home/view/home_view.dart';
import 'package:book_turf/app/sign_in/view/signin_view.dart';
import 'package:book_turf/app/sign_up/view/signup_view.dart';
import 'package:book_turf/app/splash/view/splash_view.dart';
import 'package:book_turf/app/spot/view/spot_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        SignInView.id: (context) => const SignInView(),
        SignUpView.id: (context) => const SignUpView(),
        HomeView.id: (context) => const HomeView(),
        SpotView.id: (context) => const SpotView(),
        AccountView.id: (context) => const AccountView(),
        DetailsView.id: (context) => const DetailsView(),
        BookingView.id: (context) => const BookingView(),
        CheckoutView.id: (context) => const CheckoutView(),
      },
    );
  }
}

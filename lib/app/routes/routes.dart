import 'package:book_turf/app/modules/booking/view/booking_view.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/checkout/view/checkout_view.dart';
import 'package:book_turf/app/modules/details/view/details_view.dart';
import 'package:book_turf/app/modules/email_otp/view/verification_view.dart';
import 'package:book_turf/app/modules/home/view/home_view.dart';
import 'package:book_turf/app/modules/profile/view/profile_view.dart';
import 'package:book_turf/app/modules/sign_in/view/signin_view.dart';
import 'package:book_turf/app/modules/sign_up/view/signup_view.dart';
import 'package:book_turf/app/modules/spot/view/spot_view.dart';

class Routes {
  static var routes = {
    '/': (context) => SignInView(),
    OtpVerificationView.id: (context) => const OtpVerificationView(),
    BottomNavView.id: (context) => const BottomNavView(),
    SignInView.id: (context) => SignInView(),
    SignUpView.id: (context) => SignUpView(),
    HomeView.id: (context) => const HomeView(),
    SpotView.id: (context) => const SpotView(),
    ProfileView.id: (context) => const ProfileView(),
    DetailsView.id: (context) => const DetailsView(),
    BookingView.id: (context) => const BookingView(),
    CheckoutView.id: (context) => const CheckoutView(),
  };
}

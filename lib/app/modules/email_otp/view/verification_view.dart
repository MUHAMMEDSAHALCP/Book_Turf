import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/modules/email_otp/view_model/otp_view_model.dart';
import 'package:book_turf/app/modules/sign_up/view_model/signup_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpVerificationView extends StatelessWidget {
  static String id = "otp_view";

  const OtpVerificationView({Key? key, this.newId}) : super(key: key);

  final String? newId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "OTP VERIFICATION",
                style: textStyle,
              ),
              height5,
              Text("We sent your code to  "),
              height50,
              OtpForm(),
              height50,
              Text(
                "Resend OTP cod",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Row buildTimer() {
  //   return Row(
  //     children: [
  //       const Text("This code will expired in"),
  //       TweenAnimationBuilder<Duration>(
  //         duration: const Duration(seconds: 30),
  //         tween: Tween(begin: const Duration(minutes: 30), end: Duration.zero),
  //         onEnd: () {},
  //         builder: (BuildContext context, Duration value, Widget? child) {
  //           final minutes = value.inMinutes;
  //           return Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 5),
  //             child: Text(
  //               '$minutes',
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 30),
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }
}

class OtpForm extends StatelessWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OtpViewModel otpViewModel = context.read<OtpViewModel>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.one,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.two,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.three,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.four,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
          ],
        ),
        height50,
        MaterialButtonWidget(
          text: "Continue",
          color: secondaryColor,
          textColor: whiteColor,
          onClick: () {
            otpViewModel.verifyOtp(context,
                Provider.of<SignUpViewModel>(context, listen: false ).newID!);
          },
        ),
      ],
    );
  }
}

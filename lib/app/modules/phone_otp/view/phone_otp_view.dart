import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/modules/phone_otp/view_model/phone_otp_view_model.dart';
import 'package:book_turf/app/modules/phone_signin.dart/view_model/phone_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class PhoneOtpView extends StatelessWidget {
  static String id = "phoneOtpView";
  const PhoneOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneOtpViewModel phoneOtpViewModel = context.read<PhoneOtpViewModel>();
    PhoneViewModel phoneViewModel = context.read<PhoneViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [],
          elevation: 0,
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "OTP VERIFICATION",
                  style: textStyle.copyWith(fontSize: 25),
                ),
                height5,
                Text(
                  "Enter the otp sent to ${phoneViewModel.number}",
                  style: textStyle.copyWith(
                    fontSize: 15,
                    color: greyColor,
                  ),
                ),
                height50,
                Pinput(
                  controller: phoneOtpViewModel.phoneOtpController,
                  length: 6,
                ),
                height10,
                TextButton(
                  onPressed: () {},
                  child: FittedBox(
                    child: Text(
                      " Didn't receive OTP? RESEND",
                      style: textStyle.copyWith(
                        color: primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                height50,
                MaterialButtonWidget(
                  isLoading: FittedBox(
                    child: Text(
                      "VERIFY & CONTINUE",
                      style: textStyle.copyWith(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: secondaryColor,
                  textColor: whiteColor,
                  onClick: () {
                    phoneOtpViewModel.phoneSignIn(
                      context,
                      phoneViewModel.number,
                      phoneViewModel.id,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

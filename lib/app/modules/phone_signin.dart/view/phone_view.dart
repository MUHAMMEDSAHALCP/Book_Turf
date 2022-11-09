import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/modules/phone_signin.dart/view_model/phone_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneView extends StatelessWidget {
  static String id = "phoneView";
  const PhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneViewModel phoneViewModel = context.watch<PhoneViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
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
                  "ENTER YOUR PHONE NUMBER",
                  style: textStyle.copyWith(fontSize: 20),
                ),
                height5,
                Text(
                  "We will send 4 digit verification code",
                  style: textStyle.copyWith(
                    fontSize: 15,
                    color: greyColor,
                  ),
                ),
                height50,
                Form(
                  key: phoneViewModel.formKey,
                  child: TextFormField(
                    controller: phoneViewModel.phoneNumberController,
                    decoration: inputDecoration.copyWith(
                      label: const Text(
                        "Enter your phone",
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " Please enter your number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                height50,
                MaterialButtonWidget(
                  isLoading: const Text("GENERATE OTP"),
                  color: secondaryColor,
                  textColor: whiteColor,
                  onClick: () {
                    if (phoneViewModel.formKey.currentState!.validate()) {
                      phoneViewModel.phoneSignIn(context);
                    }
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

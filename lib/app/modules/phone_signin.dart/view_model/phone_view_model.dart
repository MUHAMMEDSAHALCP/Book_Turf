import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/phone_otp/view/phone_otp_view.dart';
import 'package:book_turf/app/modules/phone_signin.dart/model/phone_model.dart';
import 'package:book_turf/app/modules/phone_signin.dart/service/phone_service.dart';
import 'package:flutter/cupertino.dart';

class PhoneViewModel extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? number;
  String? id;
  phoneSignIn(context) async {
    number = phoneNumberController.text;
    PhoneModel data = PhoneModel(userNumber: number.toString());

    PhoneModelResponse? result =
        await PhoneApiService().phoneApi(data.toJson());
    if (result != null) {
      id = result.id;
      if (result.status == true) {
        Navigator.pushNamed(context, PhoneOtpView.id);
      } else {
        SnackBarWidget.chekFormFill(context, "Something went wrong!!!");
      }
    } else {
      SnackBarWidget.chekFormFill(context, "Network connection issue!!!");
    }
  }
}

import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/home/service/home_api_service.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  String _type = "7's";
  bool isClicked = false;
  List<Datum> turfDetails = [];
  get type => _type;

  setState(value) {
    _type = value;
    notifyListeners();
  }

  void getTurfDetails(context) async {
    HomeTurfModel? homeTurfModel = await HomeApiService().getTurfdata();
    if (homeTurfModel!.status == true) {
      turfDetails.clear();
      turfDetails.addAll(homeTurfModel.data!);
      notifyListeners();
    } else {
      SnackBarWidget.chekFormFill(context, homeTurfModel.message);
    }
  }
}

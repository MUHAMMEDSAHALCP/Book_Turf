import 'package:book_turf/app/components/error_dialogue_widget.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/home/services/home_api_service.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  String _type = "Football";
  bool isClicked = false;
  List<NearestTurfDetails> turfDetails = [];
  TurfNearestData? turfModel;
  get type => _type;

  setState(value) {
    _type = value;
    notifyListeners();
  }

  void getTurfDetails(context) async {
    isLoading = true;
    turfModel = await HomeApiService().getHomeTurfdata();
    if (turfModel!.error == true) {
      turfDetails.clear();
      turfDetails.addAll(turfModel!.data!);
      isLoading = false;
      notifyListeners();
    } else {
      Navigations.pushRemoveUntil(
        ErrorDialogueWidget(
          text: turfModel!.message.toString(),
        ),
      );
    }
  }
}

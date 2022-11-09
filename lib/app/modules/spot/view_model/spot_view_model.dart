import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:flutter/material.dart';

class SpotViewModel extends ChangeNotifier {
  bool isLoading = true;
  String _type = "Football";
  bool isClicked = false;
  List<NearestTurfDetails> turfDetails = [];
  get type => _type;

  setSatate(value) {
    _type = value;
    notifyListeners();
  }
  // getTurfDetails(context) async {
  //   isLoading = true;
  //   TurfNearestData? spotTurfModel = await SpotApiService().getTurfdata();
  //   if (spotTurfModel!.error == true) {
  //     turfDetails.clear();
  //     log(spotTurfModel.status.toString());
  //     turfDetails.addAll(spotTurfModel.data!);
  //     isLoading = false;
  //     notifyListeners();
  //   } else {
  //     isLoading = false;
  //     Navigations.pushRemoveUntil(
  //       ErrorDialogueWidget(text: spotTurfModel.message.toString()),
  //     );
  //   }
  // }
}

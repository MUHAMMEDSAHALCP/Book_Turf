import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/home/service/home_api_service.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  String _type = "7's";
  bool isClicked = false;
  List<Datum> turfDetails = [];
  get type => _type;

  setSatate(value) {
    _type = value;
    notifyListeners();
  }

  getTurfDetails() async {
    HomeTurfModel? homeTurfModel = await HomeApiService().getTurfdata();
    // turfDetails.addAll(homeTurfModel!.data);
    notifyListeners();
  }
}

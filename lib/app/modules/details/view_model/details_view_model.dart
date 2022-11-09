import 'package:book_turf/app/components/error_dialogue_widget.dart';
import 'package:book_turf/app/modules/details/model/book_view_model.dart';
import 'package:book_turf/app/modules/details/services/get_book_turf_api.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsViewModel extends ChangeNotifier {
  bool isLoading = false;
  List bookedTimeSlot = [];
  List bookedDate = [];
  GetBookTurfModel? getBookTurfModel;
  getBookTurf(data, context) async {
    isLoading = true;
    bookedDate.clear();
    bookedTimeSlot.clear();
    getBookTurfModel = await GetBookTurfApi().getBookTurfApi(data.id);
    if (getBookTurfModel!.error == true) {
      for (int i = 0; i <= getBookTurfModel!.data!.length - 1; i++) {
        bookedDate.add(getBookTurfModel!.data![i].bookingDate);
        bookedTimeSlot.add(getBookTurfModel!.data![i].timeSlot);
      }
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      Navigations.push(
        ErrorDialogueWidget(
          text: getBookTurfModel!.message.toString(),
        ),
      );
    }
  }

  openMap(url) async {
    // ignore: deprecated_member_use
    if (await launch(url)) {
      throw 'could not launch';
    }
  }
}

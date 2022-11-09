import 'dart:developer';

import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel() {
    searchList = sample.turfDetails;
  }
  HomeViewModel sample =
      Messenger.rootScaffoldMessengerKey.currentContext!.read<HomeViewModel>();
  late List<NearestTurfDetails> searchList;
  runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      searchList = sample.turfDetails;
    } else {
      searchList = searchList
          .where((element) => element.turfPlace!.toUpperCase().contains(
                enteredKeyword.toUpperCase().trim(),
              ))
          .toList();
    }
    log(searchList.toString());
    notifyListeners();
  }
}

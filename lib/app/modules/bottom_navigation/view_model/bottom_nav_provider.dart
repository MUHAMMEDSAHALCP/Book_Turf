import 'package:book_turf/app/modules/home/view/home_view.dart';
import 'package:book_turf/app/modules/profile/view/profile_view.dart';
import 'package:book_turf/app/modules/spot/view/spot_view.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 1;
  final screens = [
    const SpotView(),
    const HomeView(),
    const ProfileView(),
  ];
  currentIndexState(index) {
    currentIndex = index;
    notifyListeners();
  }
}

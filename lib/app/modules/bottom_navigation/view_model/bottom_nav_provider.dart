import 'package:book_turf/app/modules/home/view/home_view.dart';
import 'package:book_turf/app/modules/profile/view/profile_view.dart';
import 'package:book_turf/app/modules/spot/view/spot_view.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 1;
  get currentIndex => _currentIndex;
  final screens = [
    const SpotView(),
    const HomeView(),
    const ProfileView(),
  ];
  set currentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}

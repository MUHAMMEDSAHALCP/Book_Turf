import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavView extends StatelessWidget {
  static String id = "main_bottom_nav_view ";

  const BottomNavView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavProvider bottomProvider = context.watch<BottomNavProvider>();

    return Scaffold(
      body: bottomProvider.screens[bottomProvider.currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: bottomProvider.currentIndex,
          onTap: (newIndex) {
            bottomProvider.currentIndexState(newIndex);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_soccer,
                size: 28,
              ),
              label: "Spot",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: "My Profile",
            ),
          ],
        ),
      ),
    );
  }
}

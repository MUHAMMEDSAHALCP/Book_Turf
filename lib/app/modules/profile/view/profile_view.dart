import 'package:book_turf/app/modules/profile/widgets/settings_widget.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static String id = "acount_view";
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "My Profile",
                  style: textStyle.copyWith(fontSize: 25),
                ),
              ),
              height20,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: boxDecoration.copyWith(
                    color: cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          backgroundColor: cardColor,
                          backgroundImage: AssetImage(
                            "assets/images/Profile.png",
                          ),
                        ),
                        width10,
                        width5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MUHAMMED SAHAL CP",
                              style: textStyle.copyWith(
                                color: blackColor,
                                fontSize: 18,
                              ),
                            ),
                            height5,
                            Text(
                              "9207870789",
                              style: textStyle.copyWith(
                                color: blackColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              height10,
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        ReusableSettingContainer(
                            title: "Notification",
                            onClick: () {},
                            icon: Icons.notifications),
                        ReusableSettingContainer(
                          title: "My Booking",
                          onClick: () {},
                          icon: Icons.check_box,
                        ),
                        ReusableSettingContainer(
                            title: "My Favourites",
                            onClick: () {},
                            icon: Icons.favorite),
                        ReusableSettingContainer(
                            title: "Invate a friend",
                            onClick: () async {},
                            icon: Icons.cleaning_services),
                        ReusableSettingContainer(
                          title: "Rate us",
                          onClick: () {},
                          icon: Icons.share,
                        ),
                        ReusableSettingContainer(
                            title: "Cancellation",
                            onClick: () {},
                            icon: Icons.cancel),
                        ReusableSettingContainer(
                            title: "Sign out",
                            onClick: () {},
                            icon: Icons.logout),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

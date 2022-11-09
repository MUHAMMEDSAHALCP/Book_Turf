import 'package:book_turf/app/modules/profile/components/my_favourite/view/my_favourite.dart';
import 'package:book_turf/app/modules/profile/components/my_favourite/view_model/favourite_view_model.dart';
import 'package:book_turf/app/modules/profile/widgets/signup_pop_up.dart';
import 'package:book_turf/app/modules/profile/widgets/settings_widget.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  static String id = "acount_view";
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MUHAMMED SAHAL CP",
                                style: textStyle.copyWith(
                                  color: blackColor,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
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
                        // ReusableSettingContainer(
                        //     title: "Notification",
                        //     onClick: () {},
                        //     icon: Icons.notifications),
                        ReusableSettingContainer(
                          title: "My Booking",
                          onClick: () {},
                          icon: Icons.check_box,
                        ),
                        ReusableSettingContainer(
                            title: "My Favourites",
                            onClick: () {
                              // Navigator.pushNamed(context, MyFavourites.id);
                              context
                                  .read<FavouriteViewModel>()
                                  .fetchData(context);
                              Navigations.push(const MyFavourites());
                            },
                            icon: Icons.favorite),
                        // ReusableSettingContainer(
                        //     title: "Invate a friend",
                        //     onClick: () async {},
                        //     icon: Icons.cleaning_services),
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
                            onClick: () {
                              signUpPopUp(context);
                            },
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

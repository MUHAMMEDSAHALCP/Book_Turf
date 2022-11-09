import 'package:book_turf/app/components/custom_appbar.dart';
import 'package:book_turf/app/components/skelton.dart';
import 'package:book_turf/app/components/turf_container.dart';
import 'package:book_turf/app/modules/details/view/details_view.dart';
import 'package:book_turf/app/modules/profile/components/my_favourite/view_model/favourite_view_model.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavourites extends StatelessWidget {
  static String id = "my_favourites";
  const MyFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
                text: "My Favourite Turfs",
                visible: false,
                favouriteOnClick: () {}),
            height20,
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Consumer<FavouriteViewModel>(
                  builder: (context, value, _) {
                    return value.favoriteList.isEmpty
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 1.5),
                            ),
                            itemBuilder: (context, index) {
                              return const TurfCardSkelton();
                            },
                          )
                        : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: value.favoriteList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 1.4),
                            ),
                            itemBuilder: (context, index) {
                              final newTurf = value.favoriteList[index];
                              return TurfContainer(
                                turfName: newTurf.turfName!,
                                turfPlace: newTurf.turfPlace!,
                                visible: false,
                                turfImage: newTurf.turfLogo!,
                                bookOnclick: () {},
                                cardOnTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsView(
                                        data: newTurf,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

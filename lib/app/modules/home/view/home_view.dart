import 'package:book_turf/app/components/choice_chip.dart';
import 'package:book_turf/app/components/search_bar.dart';
import 'package:book_turf/app/components/skelton.dart';
import 'package:book_turf/app/components/turf_container.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/modules/details/view/details_view.dart';
import 'package:book_turf/app/modules/details/view_model/details_view_model.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/modules/home/view/widget/static_card.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/modules/search/view/search_view.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  static String id = "Home_view";
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeProvider = context.watch<HomeViewModel>();
    GetUserLoction location = context.watch<GetUserLoction>();
    location.userplaceName == null ? location.getUserLocation() : null;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Selector<GetUserLoction, bool>(
          selector: (context, value) => value.isLoading,
          builder: (context, loading, _) {
            return Scaffold(
              backgroundColor: backgroundcolor,
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {
                            context.read<GetUserLoction>().getUserLocation();
                          },
                          icon: const Icon(
                            Icons.location_on,
                            color: blackColor,
                          ),
                          label: loading
                              ? const Skelton()
                              : context.read<GetUserLoction>().userplaceName ==
                                      null
                                  ? const Skelton()
                                  : FittedBox(
                                      child: Text(
                                        context
                                            .read<GetUserLoction>()
                                            .userplaceName
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyle.copyWith(
                                            fontSize: 14, color: blackColor),
                                      ),
                                    ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: SearchBarWidget(
                          onTap: () => Navigations.push(const SearchView()),
                          text: "Search turfs by place name",
                        ),
                      ),
                      height20,
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: StaticCard(size: size),
                      ),
                      height10,
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Nearby Grounds",
                              style: textStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigations.push(const BottomNavView());
                                Provider.of<BottomNavProvider>(context,
                                        listen: false)
                                    .currentIndexState(0);
                              },
                              child: Text(
                                "view All",
                                style: textStyle.copyWith(
                                    fontSize: 16, color: greyColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      height5,
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 10,
                          width: double.infinity,
                          decoration: boxDecoration.copyWith(
                            color: whiteColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                            ),
                          ),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    ChoiceChipWidget(
                                      height: size.height / 20,
                                      width: size.height / 10,
                                      onClick: (bool value) {
                                        homeProvider.setState("Cricket");
                                      },
                                      selected: homeProvider.type == "Cricket"
                                          ? true
                                          : false,
                                      text: "Cricket",
                                      textStyle: textStyle.copyWith(
                                          fontSize: 18, color: whiteColor),
                                    ),
                                    width5,
                                    ChoiceChipWidget(
                                      height: size.height / 20,
                                      width: size.height / 10,
                                      onClick: (bool value) {
                                        homeProvider.setState("Football");
                                      },
                                      selected: homeProvider.type == "Football"
                                          ? true
                                          : false,
                                      text: "Football",
                                      textStyle: textStyle.copyWith(
                                          fontSize: 18, color: whiteColor),
                                    ),
                                    width5,
                                    ChoiceChipWidget(
                                      height: size.height / 20,
                                      width: size.height / 10,
                                      onClick: (bool value) {
                                        homeProvider.setState("Badminton");
                                      },
                                      selected: homeProvider.type == "Badminton"
                                          ? true
                                          : false,
                                      text: "Badminton",
                                      textStyle: textStyle.copyWith(
                                          fontSize: 18, color: whiteColor),
                                    ),
                                    width5,
                                    ChoiceChipWidget(
                                      height: size.height / 20,
                                      width: size.height / 10,
                                      onClick: (bool value) {
                                        homeProvider.setState("Yoga");
                                      },
                                      selected: homeProvider.type == "Yoga"
                                          ? true
                                          : false,
                                      text: "Yoga",
                                      textStyle: textStyle.copyWith(
                                          fontSize: 18, color: whiteColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Consumer<HomeViewModel>(
                        builder: (context, value, child) {
                          return value.turfDetails.isEmpty
                              ? GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 4,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.5),
                                  ),
                                  itemBuilder: (context, index) {
                                    return const TurfCardSkelton();
                                  },
                                )
                              : value.isLoading == true
                                  ? GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 4,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.5),
                                      ),
                                      itemBuilder: (context, index) {
                                        return const TurfCardSkelton();
                                      },
                                    )
                                  : GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: value.turfDetails.length >= 6
                                          ? 6
                                          : value.turfDetails.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.40),
                                      ),
                                      itemBuilder: (context, index) {
                                        final turfData =
                                            value.turfDetails[index];
                                        return TurfContainer(
                                          turfName:
                                              turfData.turfName.toString(),
                                          turfPlace:
                                              turfData.turfPlace.toString(),
                                          visible: false,
                                          turfImage: turfData.turfLogo!,
                                          cardOnTap: () {
                                            context
                                                .read<DetailsViewModel>()
                                                .getBookTurf(turfData, context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsView(
                                                  data: turfData,
                                                ),
                                              ),
                                            );
                                          },
                                          bookOnclick: () {},
                                        );
                                      },
                                    );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

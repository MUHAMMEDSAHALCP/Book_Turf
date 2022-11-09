import 'package:book_turf/app/components/choice_chip.dart';
import 'package:book_turf/app/components/search_bar.dart';
import 'package:book_turf/app/components/skelton.dart';
import 'package:book_turf/app/components/turf_container.dart';
import 'package:book_turf/app/modules/details/view/details_view.dart';
import 'package:book_turf/app/modules/details/view_model/details_view_model.dart';
import 'package:book_turf/app/modules/home/services/location_api.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/modules/search/view/search_view.dart';
import 'package:book_turf/app/modules/spot/view_model/spot_view_model.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpotView extends StatelessWidget {
  static String id = "Spot_view";
  const SpotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SpotViewModel spotViewModel = context.watch<SpotViewModel>();
    return SafeArea(
      child: Scaffold(
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
                    label: context.read<GetUserLoction>().isLoading == true
                        ? const Skelton()
                        : FittedBox(
                            child: Text(
                              context
                                  .read<GetUserLoction>()
                                  .userplaceName
                                  .toString(),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  SearchBarWidget(
                      onTap: () => Navigations.push(const SearchView()),
                      text: "Search turfs by place name"),
                  height20,
                  Container(
                    decoration: boxDecoration.copyWith(
                      color: backgroundcolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChipWidget(
                          height: size.height / 20,
                          width: size.height / 10,
                          onClick: (bool value) {
                            spotViewModel.setSatate("Cricket");
                          },
                          selected:
                              spotViewModel.type == "Cricket" ? true : false,
                          text: "Cricket",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          height: size.height / 20,
                          width: size.height / 10,
                          onClick: (bool value) {
                            spotViewModel.setSatate("Football");
                          },
                          selected:
                              spotViewModel.type == "Football" ? true : false,
                          text: "Football",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          height: size.height / 20,
                          width: size.height / 10,
                          onClick: (bool value) {
                            spotViewModel.setSatate("Badminton");
                          },
                          selected:
                              spotViewModel.type == "Badminton" ? true : false,
                          text: "Badminton",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height10,
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Consumer<HomeViewModel>(
                  builder: (context, value, _) {
                    return value.turfDetails.isEmpty
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
                        : value.isLoading == true
                            ? GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 6,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.5),
                                ),
                                itemBuilder: (context, index) {
                                  return const TurfCardSkelton();
                                },
                              )
                            : GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: value.turfDetails.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.20),
                                ),
                                itemBuilder: (context, index) {
                                  final newTurf = value.turfDetails[index];
                                  return TurfContainer(
                                    turfName: newTurf.turfName!,
                                    turfPlace: newTurf.turfPlace!,
                                    visible: true,
                                    turfImage: newTurf.turfLogo!,
                                    bookOnclick: () {
                                      context
                                          .read<DetailsViewModel>()
                                          .getBookTurf(newTurf, context);
                                      Navigations.push(DetailsView(
                                        data: newTurf,
                                      ));
                                    },
                                    cardOnTap: () {
                                      context
                                          .read<DetailsViewModel>()
                                          .getBookTurf(newTurf, context);
                                      Navigations.push(DetailsView(
                                        data: newTurf,
                                      ));
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

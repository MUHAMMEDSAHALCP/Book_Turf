import 'package:book_turf/app/components/choice_chip.dart';
import 'package:book_turf/app/components/turf_container.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/modules/home/widget/static_card.dart';
import 'package:book_turf/app/modules/spot/view/spot_view.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  static String id = "Home_view";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeViewModel>();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    color: blackColor,
                  ),
                  label: Text(
                    "Thottummal, Thalassery...",
                    style: textStyle.copyWith(
                      color: blackColor,
                      fontSize: 15,
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
                  CupertinoSearchTextField(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  height20,
                  StaticCard(size: size),
                  height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nearby Grounds",
                        style: textStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SpotView.id);
                        },
                        child: Text(
                          "view All",
                          style: textStyle.copyWith(
                              fontSize: 16, color: greyColor),
                        ),
                      ),
                    ],
                  ),
                  height5,
                  Container(
                    decoration: boxDecoration.copyWith(
                      color: whiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChipWidget(
                          onClick: (bool value) {
                            homeProvider.setSatate("5's");
                          },
                          selected: homeProvider.type == "5's" ? true : false,
                          text: "5's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {
                            homeProvider.setSatate("6's");
                          },
                          selected: homeProvider.type == "6's" ? true : false,
                          text: "6's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {
                            homeProvider.setSatate("7's");
                          },
                          selected: homeProvider.type == "7's" ? true : false,
                          text: "7's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {
                            homeProvider.setSatate("9's");
                          },
                          selected: homeProvider.type == "9's" ? true : false,
                          text: "9's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {
                            homeProvider.setSatate("11's");
                          },
                          selected: homeProvider.type == "11's" ? true : false,
                          text: "11's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height5,
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Consumer<HomeViewModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.2),
                      ),
                      itemBuilder: (context, index) {
                        return const TurfContainer(
                          turfName: "Jawans Arena",
                          visible: false,
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

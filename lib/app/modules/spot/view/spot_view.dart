import 'package:book_turf/app/components/choice_chip.dart';
import 'package:book_turf/app/components/turf_container.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpotView extends StatelessWidget {
  static String id = "Spot_view";
  const SpotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                )
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
                  Container(
                    decoration: boxDecoration.copyWith(
                      color: whiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChipWidget(
                          onClick: (bool value) {},
                          selected: false,
                          text: "5's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {},
                          selected: false,
                          text: "6's",
                          textStyle: textStyle.copyWith(
                              fontSize: 18, color: whiteColor),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {},
                          selected: true,
                          text: "7's",
                          textStyle: textStyle,
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {},
                          selected: false,
                          text: "9's",
                          textStyle: textStyle.copyWith(
                            fontSize: 18,
                            color: whiteColor,
                          ),
                        ),
                        ChoiceChipWidget(
                          onClick: (bool value) {},
                          selected: false,
                          text: "11's",
                          textStyle: textStyle.copyWith(
                            fontSize: 18,
                            color: whiteColor,
                          ),
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
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1),
                  ),
                  itemBuilder: (context, index) {
                    return const TurfContainer(
                      visible: true,
                      turfName: "Jawans",
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

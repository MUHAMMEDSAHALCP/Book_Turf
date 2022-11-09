import 'package:book_turf/app/modules/booking/view/widgets/time_model.dart';
import 'package:book_turf/app/modules/checkout/view_model/checkout_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedTimeSlotCard extends StatelessWidget {
  const SelectedTimeSlotCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CheckOutViewModel>(
          builder: (context, value, _) {
            return Visibility(
              visible: value.isMorTure == true ? true : false,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: boxDecoration.copyWith(
                  color: cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height10,
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Morning"),
                    ),
                    height10,
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: value.morningSelectedTimeSlot.length,
                              itemBuilder: (BuildContext context, int index) {
                                final dataNew =
                                    value.morningSelectedTimeSlot[index];
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: MorningTime(
                                        color: redColor,
                                        index: 0,
                                        onClick: () {},
                                        text: dataNew,
                                      ),
                                    ),
                                  ],
                                );
                              })),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        height10,
        Consumer<CheckOutViewModel>(
          builder: (context, value, _) {
            return Visibility(
              visible: value.isAftTure == true ? true : false,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: boxDecoration.copyWith(
                  color: cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height10,
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Afternoon"),
                    ),
                    height10,
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.afternoonSelectedTimeSlot.length,
                          itemBuilder: (BuildContext context, int index) {
                            final dataNew =
                                value.afternoonSelectedTimeSlot[index];
                            return Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: MorningTime(
                                    color: redColor,
                                    index: 0,
                                    onClick: () {},
                                    text: dataNew,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        height10,
        Consumer<CheckOutViewModel>(
          builder: (context, value, _) {
            return Visibility(
              visible: value.isEveTure == true ? true : false,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: boxDecoration.copyWith(
                  color: cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height10,
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Evening"),
                    ),
                    height10,
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.eveningSelectedTimeSlot.length,
                          itemBuilder: (BuildContext context, int index) {
                            final dataNew =
                                value.eveningSelectedTimeSlot[index];
                            return Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: MorningTime(
                                    color: redColor,
                                    index: 0,
                                    onClick: () {},
                                    text: dataNew,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

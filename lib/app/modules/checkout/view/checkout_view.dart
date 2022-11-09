import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/components/custom_appbar.dart';
import 'package:book_turf/app/modules/booking/view_model/booking_view_model.dart';
import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/modules/checkout/view/widgets/icon_text_widget.dart';
import 'package:book_turf/app/modules/checkout/view/widgets/selected_time_slot.dart';
import 'package:book_turf/app/modules/checkout/view_model/checkout_view_model.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  static String id = "Checkout_view";
  final NearestTurfDetails? data;
  final String totalAmount;
  final DateTime dateTime;
  const CheckoutView(
      {Key? key, this.data, required this.totalAmount, required this.dateTime})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              height20,
              CustomAppBar(
                text: "Booking",
                visible: false,
                favouriteOnClick: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: boxDecoration.copyWith(
                        color: cardColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: cardColor,
                              backgroundImage: NetworkImage(
                                data!.turfLogo!,
                              ),
                            ),
                            width10,
                            width5,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data!.turfName!,
                                    style: textStyle.copyWith(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                  ),
                                  height5,
                                  Text(
                                    data!.turfPlace!,
                                    style: textStyle.copyWith(
                                      fontSize: 15,
                                      color: greyColor,
                                    ),
                                    maxLines: 1,
                                  ),
                                  height20,
                                  const IconAndText(
                                      color: blackColor,
                                      iconVisible: true,
                                      doubleColonVisible: false,
                                      amountVisible: false,
                                      icon: Icons.circle_rounded,
                                      text: "6's"),
                                  height5,
                                  IconAndText(
                                      color: blackColor,
                                      iconVisible: true,
                                      doubleColonVisible: false,
                                      amountVisible: false,
                                      icon: Icons.calendar_today,
                                      text: DateFormat.MMMMEEEEd()
                                          .format(dateTime)
                                          .toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height20,
                    Text("Selected time slots",
                        style: textStyle.copyWith(
                            color: secondaryColor, fontSize: 15)),
                    height10,
                    const SelectedTimeSlotCard(),
                    height20,
                    Container(
                      decoration: boxDecoration.copyWith(
                        color: cardColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            width10,
                            width5,
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    height5,
                                    height5,
                                    const IconAndText(
                                      color: blackColor,
                                      iconVisible: false,
                                      doubleColonVisible: true,
                                      amountVisible: true,
                                      text: "Offer discount           :",
                                      amount: "                  ₹ 0.00",
                                    ),
                                    height5,
                                    const IconAndText(
                                      color: blackColor,
                                      iconVisible: false,
                                      doubleColonVisible: true,
                                      amountVisible: true,
                                      text: "Payable at vaneu      :",
                                      amount: "                  ₹ 0.00",
                                    ),
                                    height5,
                                    IconAndText(
                                      color: redColor,
                                      iconVisible: false,
                                      doubleColonVisible: true,
                                      amountVisible: true,
                                      text: "Final Amount             :",
                                      amount:
                                          "                   ₹ $totalAmount.00",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height20,
                    Container(
                      width: double.infinity,
                      decoration: boxDecoration.copyWith(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                      ),
                      child: MaterialButtonWidget(
                        isLoading: Text(
                          "Proceed to pay    ₹ $totalAmount.00",
                          style: textStyle.copyWith(
                            color: whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: secondaryColor,
                        textColor: whiteColor,
                        onClick: () {
                          Provider.of<CheckOutViewModel>(context, listen: false)
                              .razorPay();
                          Provider.of<BookingViewModel>(context, listen: false)
                              .bookingTurf(data!);
                          Provider.of<BottomNavProvider>(context, listen: false)
                              .currentIndexState(1);
                        },
                        height: 60,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "By continuing to the payment you agree to our Terms & conditions",
                        style: textStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

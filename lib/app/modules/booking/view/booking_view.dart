import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/components/custom_appbar.dart';
import 'package:book_turf/app/components/turf_type_bar.dart';
import 'package:book_turf/app/modules/booking/view/widgets/no_more_booking.dart';
import 'package:book_turf/app/modules/booking/view/widgets/time_and_price.dart';
import 'package:book_turf/app/modules/booking/view/widgets/time_choose_widget.dart';
import 'package:book_turf/app/modules/booking/view/widgets/time_model.dart';
import 'package:book_turf/app/modules/booking/view_model/booking_view_model.dart';
import 'package:book_turf/app/modules/details/widgets/circle_avatar.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingView extends StatelessWidget {
  static String id = "booking_view";
  final NearestTurfDetails? data;
  const BookingView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingViewModel bookingViewModel = context.read<BookingViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: Column(
          children: [
            height10,
            CustomAppBar(
              text: "Booking",
              visible: false,
              favouriteOnClick: () {},
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CircleAvatarWidget(
                      networkImage: data!.turfLogo.toString(),
                      radius: 75,
                      borderRadius: 80,
                    ),
                    Text(
                      data!.turfName!,
                      style: textStyle,
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        bookingViewModel.disposeValue();
                        bookingViewModel.datePicker(context);
                        await bookingViewModel.addTurfTimeSlot(data!, context);
                      },
                      icon: const Icon(Icons.calendar_today_rounded),
                      label: Text(
                        DateFormat.MMMMEEEEd().format(
                            context.watch<BookingViewModel>().selectedDate!),
                      ),
                    ),
                    height50,
                    height30,
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: boxDecoration.copyWith(color: primaryColor),
                      child: Center(
                        child: TurfTypeBar(
                          text: data!.turfType!.turfSixes! == true
                              ? "6's"
                              : "7's",
                        ),
                      ),
                    ),
                    height30,
                    StartEndTimeWidget(
                      text: "Select time slot",
                      onClick: () {
                        bookingViewModel.addTurfTimeSlot(data!, context);
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0))),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 40),
                                      ),
                                    ),
                                    height5,
                                    const Text(
                                        "Here only show case available time slot already booked and time expired slots are invisible."),
                                    height10,
                                    TimeAndPrice(
                                        time: "Morning",
                                        price: data!.turfPrice!.morningPrice
                                            .toString()),
                                    height10,
                                    Expanded(
                                      child: Consumer<BookingViewModel>(
                                        builder: (context, value, _) {
                                          return value.morningTimeSlot.isEmpty
                                              ? const NoMoreBooking(
                                                  text:
                                                      "Morning Slots N/A No More Booking",
                                                )
                                              : GridView.builder(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemCount: value
                                                      .morningTimeSlot.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4),
                                                  ),
                                                  itemBuilder:
                                                      (context, index1) {
                                                    final time =
                                                        value.morningTimeSlot[
                                                            index1];
                                                    return Column(
                                                      children: [
                                                        MorningTime(
                                                          index: index1,
                                                          onClick: () {
                                                            bookingViewModel
                                                                    .morningSelectedIndex
                                                                    .contains(
                                                                        index1)
                                                                ? bookingViewModel
                                                                    .morningUnSelectColor(
                                                                        index1)
                                                                : bookingViewModel
                                                                    .morningSelectColor(
                                                                        index1);
                                                          },
                                                          text: time,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                        },
                                      ),
                                    ),
                                    height10,
                                    TimeAndPrice(
                                        time: "Afternoon",
                                        price: data!.turfPrice!.afternoonPrice
                                            .toString()),
                                    height10,
                                    Expanded(
                                      child: Consumer<BookingViewModel>(
                                          builder: (context, value, _) {
                                        return value.afternoonTimeSlot.isEmpty
                                            ? const NoMoreBooking(
                                                text:
                                                    "Afternoon Slots N/A No More Booking",
                                              )
                                            : GridView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: value
                                                    .afternoonTimeSlot.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        childAspectRatio: MediaQuery
                                                                    .of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4)),
                                                itemBuilder: (context, index2) {
                                                  final time =
                                                      value.afternoonTimeSlot[
                                                          index2];
                                                  return Column(
                                                    children: [
                                                      AfterNoonTime(
                                                        index: index2,
                                                        onClick: () {
                                                          bookingViewModel
                                                                  .afterNoonSelectedIndex
                                                                  .contains(
                                                                      index2)
                                                              ? bookingViewModel
                                                                  .afterNoonUnSelectColor(
                                                                      index2)
                                                              : bookingViewModel
                                                                  .afterNoonSelectColor(
                                                                      index2);
                                                        },
                                                        text: time,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                      }),
                                    ),
                                    height10,
                                    TimeAndPrice(
                                        time: "Evening",
                                        price: data!.turfPrice!.eveningPrice
                                            .toString()),
                                    height10,
                                    Expanded(
                                      child: Consumer<BookingViewModel>(
                                        builder: (context, value, _) {
                                          return value.eveningTimeSlot.isEmpty
                                              ? const NoMoreBooking(
                                                  text:
                                                      "Evening Slots N/A No More Booking",
                                                )
                                              : GridView.builder(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemCount: value
                                                      .eveningTimeSlot.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4),
                                                  ),
                                                  itemBuilder:
                                                      (context, index3) {
                                                    final time =
                                                        value.eveningTimeSlot[
                                                            index3];
                                                    return Column(
                                                      children: [
                                                        EveningTime(
                                                          index: index3,
                                                          onClick: () {
                                                            bookingViewModel
                                                                    .eveningSelectedIndex
                                                                    .contains(
                                                                        index3)
                                                                ? bookingViewModel
                                                                    .eveningUnSelectColor(
                                                                        index3)
                                                                : bookingViewModel
                                                                    .eveningSelectColor(
                                                                        index3);
                                                          },
                                                          text: time,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            height50,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButtonWidget(
                isLoading: Text(
                  "Next",
                  style: textStyle.copyWith(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: secondaryColor,
                textColor: whiteColor,
                onClick: () {
                  bookingViewModel.checkTimeSlotSelectedOrNot(data!, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

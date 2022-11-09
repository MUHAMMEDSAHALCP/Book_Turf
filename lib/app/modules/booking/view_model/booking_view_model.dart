import 'dart:developer';
import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/booking/model/booking_model.dart';
import 'package:book_turf/app/modules/booking/services/booking_api_service.dart';
import 'package:book_turf/app/modules/checkout/view/checkout_view.dart';
import 'package:book_turf/app/modules/checkout/view_model/checkout_view_model.dart';
import 'package:book_turf/app/modules/details/view_model/details_view_model.dart';
import 'package:book_turf/app/modules/details/model/book_view_model.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingViewModel extends ChangeNotifier {
  DateTime? selectedDate = DateTime.now();
  String? selectedDateNew;
  String? newBookedDate;
  List morTurfTimeSlot = [];
  List aftTurfTimeSlot = [];
  List eveTurfTimeSlot = [];
  List<int> sortedBookedTimeSlot = [];
  List morningTimeSlot = [];
  List afternoonTimeSlot = [];
  List eveningTimeSlot = [];
  List<int> morningSelectedIndex = [];
  List<int> afterNoonSelectedIndex = [];
  List<int> eveningSelectedIndex = [];
  List bookedTimenewList = [];
  List withoutDuplicateBookedTime = [];
  List selectedTimeSlot = [];
  List finallySelectedTimeSlot = [];
  List bookedTimeSlot = [];
  List bookedDate = [];
  int totalAmount = 0;

  ammountChecking(NearestTurfDetails turfData) {
    int morningCount = 0;
    int afternoonCount = 0;
    int eveningCount = 0;

    for (int i = 0; i < selectedTimeSlot.length; i++) {
      if (selectedTimeSlot[i] < 12) {
        morningCount++;
      } else if (selectedTimeSlot[i] >= 12 && selectedTimeSlot[i] < 17) {
        afternoonCount++;
      } else {
        eveningCount++;
      }
    }
    totalAmount = turfData.turfPrice!.morningPrice! * morningCount +
        turfData.turfPrice!.afternoonPrice! * afternoonCount +
        turfData.turfPrice!.eveningPrice! * eveningCount;
    log(totalAmount.toString());
  }

  checkTimeSlotSelectedOrNot(trufData, context) {
    ammountChecking(trufData);
    Provider.of<CheckOutViewModel>(context, listen: false)
        .showSelectedTimeSlot(selectedTimeSlot);
    finallySelectedTimeSlot = selectedTimeSlot.toSet().toList();
    if (finallySelectedTimeSlot.isEmpty) {
      return SnackBarWidget.chekFormFill(
          context, "Please select time slot for booking !!!");
    } else {
      disposeValue();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckoutView(
                    data: trufData,
                    totalAmount: totalAmount.toString(),
                    dateTime: selectedDate!,
                  )));
      selectedTimeSlot.clear();
    }
  }

  void bookingTurf(NearestTurfDetails turfData) async {
    BookingTurfModel data = BookingTurfModel(
      bookingDate: selectedDateNew,
      timeSlot: finallySelectedTimeSlot,
      turfId: turfData.id,
    );
    log(data.timeSlot!.toString());
    log(data.bookingDate!.toString());
    log(data.turfId!.toString());

    BookingTurfModelResponse bookingResponse =
        await BookingAPiService().bookingApi(data);
    if (bookingResponse.status == true) {
      log("Successfully booked");
    }
  }

  morningSelectColor(index) {
    morningSelectedIndex.add(index);
    selectedTimeSlot.add(morTurfTimeSlot[index]);
    log("selectedTimeSlot:$selectedTimeSlot");
    notifyListeners();
  }

  morningUnSelectColor(index) {
    morningSelectedIndex.remove(index);
    selectedTimeSlot.remove(morTurfTimeSlot[index]);
    log("selectedTimeSlot:$selectedTimeSlot");
    notifyListeners();
  }

  void afterNoonSelectColor(index) {
    afterNoonSelectedIndex.add(index);
    selectedTimeSlot.add(aftTurfTimeSlot[index]);
    log("selectedTimeSlot:$selectedTimeSlot");
    notifyListeners();
  }

  afterNoonUnSelectColor(index) {
    afterNoonSelectedIndex.remove(index);
    selectedTimeSlot.remove(aftTurfTimeSlot[index]);
    log("UnselectedTimeSlot:$selectedTimeSlot");
    notifyListeners();
  }

  eveningSelectColor(index) {
    eveningSelectedIndex.add(index);
    selectedTimeSlot.add(eveTurfTimeSlot[index]);
    log("selectedTimeSlot:$selectedTimeSlot");
    notifyListeners();
  }

  eveningUnSelectColor(index) {
    eveningSelectedIndex.remove(index);
    selectedTimeSlot.remove(eveTurfTimeSlot[index]);
    log("UnselectedTimeSlot:$selectedTimeSlot");
    notifyListeners();
  }

  checkTurfSlots(data, context) {
    log("time before : ${afternoonTimeSlot.toString()}");
    log(" time after: ${aftTurfTimeSlot.toString()}");
    log(" Selected time : ${eveningSelectedIndex.toString()}");
    bookedDate.clear();
    bookedTimeSlot.clear();
    GetBookTurfModel? getBookTurfModel =
        Provider.of<DetailsViewModel>(context, listen: false).getBookTurfModel;
    log("entered");
    log("Selected new date : ${selectedDateNew.toString()}");
    if (getBookTurfModel!.status == true) {
      for (int i = 0; i < getBookTurfModel.data!.length; i++) {
        bookedDate.add(getBookTurfModel.data![i].bookingDate);
        bookedTimeSlot.add(getBookTurfModel.data![i].timeSlot);
      }
      log(bookedDate.toString());
      log(bookedTimeSlot.toString());
      log("entered");
      int count = 0;

      log("Selected new date : ${selectedDateNew.toString()}");
      for (var element in bookedDate) {
        if (selectedDateNew == element) {
          newBookedDate = element;
          bookedTimenewList = bookedTimeSlot[count];
        }
        count++;
      }
      if (selectedDateNew == newBookedDate) {
        log("In this date there have booked time slot");
        withoutDuplicateBookedTime = bookedTimenewList.toSet().toList();
        log(newBookedDate.toString());
        log(bookedTimenewList.toString());
        log("booked time list : ${withoutDuplicateBookedTime.toString()}");
        log(" turfTimeslot : ${eveTurfTimeSlot.toString()}");
        for (int i = 0; i < withoutDuplicateBookedTime.length; i++) {
          for (int j = 0; j < morTurfTimeSlot.length; j++) {
            if (withoutDuplicateBookedTime[i] == morTurfTimeSlot[j]) {
              log("Already booked");
              morningTimeSlot.removeAt(j);
              morTurfTimeSlot.removeAt(j);
            }
          }
          for (int k = 0; k < aftTurfTimeSlot.length; k++) {
            if (withoutDuplicateBookedTime[i] == aftTurfTimeSlot[k]) {
              log("Already booked");
              afternoonTimeSlot.removeAt(k);
              aftTurfTimeSlot.removeAt(k);
            }
          }
          for (int p = 0; p < eveTurfTimeSlot.length; p++) {
            if (withoutDuplicateBookedTime[i] == eveTurfTimeSlot[p]) {
              log("Already booked");
              eveningTimeSlot.removeAt(p);
              eveTurfTimeSlot.removeAt(p);
            }
          }
        }
      } else {
        log("In this date there no more booked time slot");
      }
    }
  }

  addTurfTimeSlot(NearestTurfDetails data, context) async {
    selectedDateNew = DateFormat.yMd().format(selectedDate!);
    String formattedTime = DateFormat.H().format(DateTime.now());
    log(formattedTime.toString());
    String currentDate = DateFormat.yMd().format(DateTime.now());
    log(currentDate.toString());
    morningTimeSlot.clear();
    morTurfTimeSlot.clear();
    int morningSlotStartTime = data.turfTime!.timeMorningStart!.toInt();
    int morningSlotEndTime = data.turfTime!.timeMorningEnd!.toInt();
    for (int i = morningSlotStartTime; i < morningSlotEndTime; i++) {
      int start = i;
      int end = i + 1;
      String time = "$start:00 - $end:00";

      if (selectedDateNew == currentDate) {
        if (start > int.parse(formattedTime)) {
          morTurfTimeSlot.add(start);
          morningTimeSlot.add(time);
          notifyListeners();
        }
      } else {
        morTurfTimeSlot.add(start);
        morningTimeSlot.add(time);
        notifyListeners();
      }
    }

    afternoonTimeSlot.clear();
    aftTurfTimeSlot.clear();
    int afternoonSlotStartTime = data.turfTime!.timeAfternoonStart!.toInt();
    int afternoonSlotEndTime = data.turfTime!.timeAfternoonEnd!.toInt();

    for (int i = afternoonSlotStartTime; i <= afternoonSlotEndTime - 1; i++) {
      int startTime = i;
      int start = i > 12 ? i - 12 : i;
      int end = i + 1 > 12 ? i + 1 - 12 : i;
      String time = " $start:00 - $end:00";

      if (selectedDateNew == currentDate) {
        if (startTime > int.parse(formattedTime)) {
          aftTurfTimeSlot.add(startTime);
          afternoonTimeSlot.add(time);
          notifyListeners();
        }
      } else {
        aftTurfTimeSlot.add(startTime);
        afternoonTimeSlot.add(time);
        notifyListeners();
      }
    }
    eveningTimeSlot.clear();
    eveTurfTimeSlot.clear();
    int eveningSlotStartTime = data.turfTime!.timeEveningStart!.toInt();
    int eveningSlotEndTime = data.turfTime!.timeEveningEnd!.toInt();
    for (int i = eveningSlotStartTime; i <= eveningSlotEndTime - 1; i++) {
      int startTime = i;
      int start = i > 12 ? i - 12 : i;
      int end = i + 1 > 12 ? i + 1 - 12 : i;
      String time = " $start:00 - $end:00";

      if (selectedDateNew == currentDate) {
        if (startTime > int.parse(formattedTime)) {
          eveTurfTimeSlot.add(startTime);
          eveningTimeSlot.add(time);
          notifyListeners();
        }
      } else {
        eveTurfTimeSlot.add(startTime);
        eveningTimeSlot.add(time);
        notifyListeners();
      }
    }
    await checkTurfSlots(data, context);
  }

  datePicker(context) async {
    final selectedDateTemp = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 60),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 60),
      ),
    );
    if (selectedDateTemp == null) {
      log("no data");
      return null;
    } else {
      selectedDate = selectedDateTemp;
      notifyListeners();
    }
  }

  void disposeValue() {
    morningSelectedIndex.clear();
    afterNoonSelectedIndex.clear();
    eveningSelectedIndex.clear();
  }
}

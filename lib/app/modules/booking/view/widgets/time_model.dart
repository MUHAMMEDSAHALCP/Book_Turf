import 'package:book_turf/app/modules/booking/view_model/booking_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MorningTime extends StatelessWidget {
  final String text;
  final int index;
  final Function() onClick;
  final Color? color;

  const MorningTime({
    super.key,
    required this.text,
    required this.index,
    required this.onClick,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    BookingViewModel bookingViewModel = context.read<BookingViewModel>();
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 45,
        decoration: boxDecoration.copyWith(
          color: bookingViewModel.morningSelectedIndex.contains(index)
              ? primaryColor
              : cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: color ?? secondaryColor,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: textStyle.copyWith(
                  fontSize: 14,
                  color: bookingViewModel.morningSelectedIndex.contains(index)
                      ? whiteColor
                      : blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AfterNoonTime extends StatelessWidget {
  final String text;
  final int index;
  final Function() onClick;

  const AfterNoonTime({
    super.key,
    required this.text,
    required this.index,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    BookingViewModel bookingViewModel = context.read<BookingViewModel>();
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 45,
        decoration: boxDecoration.copyWith(
          color: bookingViewModel.afterNoonSelectedIndex.contains(index)
              ? primaryColor
              : cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: secondaryColor,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: textStyle.copyWith(
                  fontSize: 14,
                  color: bookingViewModel.afterNoonSelectedIndex.contains(index)
                      ? whiteColor
                      : blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EveningTime extends StatelessWidget {
  final String text;
  final int index;
  final Function() onClick;

  const EveningTime({
    super.key,
    required this.text,
    required this.index,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    BookingViewModel bookingViewModel = context.read<BookingViewModel>();
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 45,
        decoration: boxDecoration.copyWith(
          color: bookingViewModel.eveningSelectedIndex.contains(index)
              ? primaryColor
              : cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: secondaryColor,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: textStyle.copyWith(
                  fontSize: 14,
                  color: bookingViewModel.eveningSelectedIndex.contains(index)
                      ? whiteColor
                      : blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

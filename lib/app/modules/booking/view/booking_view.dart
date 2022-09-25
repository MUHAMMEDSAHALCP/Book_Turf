import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  static String id = "booking_view";
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Booking View ",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

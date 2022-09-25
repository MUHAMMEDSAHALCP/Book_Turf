import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  static String id = "Checkout_view";
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            " CheckOut View ",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

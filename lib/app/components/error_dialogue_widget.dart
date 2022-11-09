import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/home/view_model/home_view_model.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorDialogueWidget extends StatelessWidget {
  final String text;
  const ErrorDialogueWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(child: Text(text, style: textStyle)),
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              Navigations.push(const BottomNavView());
              context.read<HomeViewModel>().getTurfDetails(context);
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}

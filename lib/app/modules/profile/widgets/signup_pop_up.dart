import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/modules/sign_in/view/signin_view.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signUpPopUp(
  context,
) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(10),
        title: const Text(
          "Are You Sure?",
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        backgroundColor: cardColor,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Do you want to Sign out?",
                style: TextStyle(
                  fontFamily: "CrimsonText",
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text(
                      "No",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final sharedPreferences =
                          await SharedPreferences.getInstance();
                      FlutterSecureStorage secureStorage =
                          const FlutterSecureStorage();
                      sharedPreferences.clear();
                      secureStorage.deleteAll();
                      // Navigator.pushNamed(context, SignInView.id);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignInView()),
                          (route) => false);
                      Provider.of<BottomNavProvider>(context, listen: false)
                          .currentIndexState(1);
                    },
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      );
    },
  );
}

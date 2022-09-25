// import 'dart:async';
// import 'package:book_turf/app/sign_in/view/signin_view.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class SplashView extends StatelessWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Future.delayed(
//         const Duration(milliseconds: 2500),
//         () => Navigator.pushNamed(context, SignInView.id),
//       );
//     });
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Lottie.asset(
//             "assets/101732-football-kick.json",
//           ),
//         ],
//       ),
//     );
//   }
// }

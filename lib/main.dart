import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/material.dart';

import 'app/provider/provider.dart';

void main() {
  runApp(
    Providers.provider(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: Routes.routes,
    );
  }
}

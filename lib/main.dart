import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'Screens/AuthScreens/LoginScreen.dart';
import 'Screens/AuthScreens/RegisterScreen.dart';
import 'Screens/PlanListScreen/PlanListScreen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      initialRoute: PlanListScreen.pageName,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => PlanListScreen(),
        PlanListScreen.pageName: (context) => PlanListScreen(),
        LoginScreen.pageName: (context) => LoginScreen(),
        RegisterScreen.pageName: (context) => RegisterScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );

    //  PlanListScreen();
  }
}

// initialRoute: '/',
//   routes: {
//     // When navigating to the "/" route, build the FirstScreen widget.
//     '/': (context) => const FirstScreen(),
//     // When navigating to the "/second" route, build the SecondScreen widget.
//     '/second': (context) => const SecondScreen(),
//   },

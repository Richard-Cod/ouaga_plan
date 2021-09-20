import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/LoginScreen.dart';
import 'package:flutter_app/Screens/PlanListScreen.dart';
import 'package:flutter_app/Screens/RegisterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: RegisterScreen.pageName,
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

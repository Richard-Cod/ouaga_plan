import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'Screens/AuthScreens/LoginScreen.dart';
import 'Screens/AuthScreens/RegisterScreen.dart';
import 'Screens/PlanListScreen/PlanListScreen.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      initialRoute: LoginScreen.pageName,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
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

// class App extends StatefulWidget {
//   // Create the initialization Future outside of `build`:
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   /// The future is part of the state of our widget. We should not call `initializeApp`
//   /// directly inside [build].
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return MaterialApp(
//             home: Text("An error occured"),
//           );
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MyApp();
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return MaterialApp(
//           home: Text("Loading"),
//         );
//       },
//     );
//   }
// }

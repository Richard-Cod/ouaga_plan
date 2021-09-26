import 'package:flutter/material.dart';

Widget showLogo() {
  return Padding(
    padding: const EdgeInsets.only(top: 100.0),
    child: Center(
      child: Container(
          width: 200,
          height: 150,
          // decoration: BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.circular(50.0)),
          child: Image.asset('assets/images/logo.jpg')),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/AuthScreens/RegisterScreen.dart';

createAccountIfNotExist({@required context}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => RegisterScreen()));
    },
    child: Text(
      "Pas de compte ? S'inscrire",
      style: TextStyle(color: Colors.blueAccent, fontSize: 15),
    ),
  );
}

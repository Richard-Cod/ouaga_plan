import 'package:flutter/material.dart';

import '../LoginScreen.dart';

loginIfAlreadyHaveAccount({context}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    },
    child: Text(
      "Déja un compte ? Se connecter",
      style: TextStyle(color: Colors.blueAccent, fontSize: 15),
    ),
  );
}

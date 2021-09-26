import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/PlanListScreen/PlanListScreen.dart';
import 'package:flutter_app/utils/Authenticator/IAuthenticator.dart';
import 'package:flutter_app/utils/Authenticator/InMemoryAuthenticator.dart';
import 'package:flutter_app/utils/Authenticator/notifyUser.dart';

IAuthenticator authenticator = InMemorAuthenticator();

authWithEmailAndPasswordButton(
    {context, bool isLogin = true, @required formValidationFunc}) {
  return Container(
    height: 50,
    width: 250,
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(20)),
    child: FlatButton(
      onPressed: () {
        if (formValidationFunc()) {
          if (isLogin) {
            handleLogin(context);
            return;
          }
          handleRegisteration(context);
        }
      },
      child: Text(
        isLogin ? "Connexion" : "Inscription",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    ),
  );
}

void handleLogin(context) {
  try {
    authenticator.loginWithEmailAndPassword("email", "password");
    Navigator.pushReplacementNamed(context, PlanListScreen.pageName);
  } catch (e) {
    notifyUser(context, "Erreur", e.toString());
  }
}

void handleRegisteration(context) {
  try {
    print("registered");
    authenticator.registerWithEmailAndPassword("email", "password");
    Navigator.pushReplacementNamed(context, PlanListScreen.pageName);
  } catch (e) {
    notifyUser(context, "Erreur", e.toString());
  }
}

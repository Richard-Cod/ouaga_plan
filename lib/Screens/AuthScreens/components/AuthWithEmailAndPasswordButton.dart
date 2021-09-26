import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/PlanListScreen/PlanListScreen.dart';
import 'package:flutter_app/utils/Authenticator/FirebaseAuthenticator.dart';
import 'package:flutter_app/utils/Authenticator/IAuthenticator.dart';
import 'package:flutter_app/utils/Authenticator/notifyUser.dart';

IAuthenticator authenticator = FirebaseAuthenticator();

authWithEmailAndPasswordButton(
    {context,
    bool isLogin = true,
    @required formValidationFunc,
    @required String email,
    @required String password}) {
  return Container(
    height: 50,
    width: 250,
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(20)),
    child: FlatButton(
      onPressed: () {
        if (formValidationFunc()) {
          if (isLogin) {
            handleLogin(context, email, password);
            return;
          }
          handleRegisteration(context, email, password);
        }
      },
      child: Text(
        isLogin ? "Connexion" : "Inscription",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    ),
  );
}

void handleLogin(context, email, password) async {
  try {
    print("success");
    print(email);
    print(password);
    await authenticator.loginWithEmailAndPassword(email, password);
    print("dd");
    // Navigator.pushReplacementNamed(context, PlanListScreen.pageName);
  } catch (e) {
    notifyUser(context, "Erreur", e.toString());
  }
}

void handleRegisteration(context, email, password) async {
  try {
    print("registered");
    await authenticator.registerWithEmailAndPassword(email, password);
    // Navigator.pushReplacementNamed(context, PlanListScreen.pageName);
  } catch (e) {
    notifyUser(context, "Erreur", e.toString());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/LoginScreen.dart';
import 'package:flutter_app/Screens/RegisterScreen.dart';
import 'package:flutter_app/utils/AuthInputValidator.dart';

import 'PlanListScreen.dart';

class AuthScreensLogic {
  static Widget getSocialsIcons({@required context, bool isLogin = true}) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width * 0.7,
      // color: Colors.blueAccent,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialButton(
              Image.asset(
                "assets/icons/google.png",
                height: 40,
              ),
              isLogin ? loginWithGoogle : registerWithGoogle,
            ),
            buildSocialButton(
              Image.asset(
                "assets/icons/facebook.png",
                height: 40,
              ),
              isLogin ? loginWithFacebook : registerWithFacebook,
            )
          ],
        ),
      ),
    );
  }

  static Widget buildSocialButton(Image image, Function loginFunc) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: InkWell(onTap: () => loginFunc(), child: image),
    );
  }

  static Widget showLogo() {
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

  static loginWithGoogle() {
    print("loginWithGoogle");
  }

  static loginWithFacebook() {
    print("loginWithFacebook");
  }

  static registerWithGoogle() {
    print("registerWithGoogle");
  }

  static registerWithFacebook() {
    print("registerWithFacebook");
  }

  static Widget getEmailField(Function formValidationFunc) {
    return Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        onChanged: (String value) {
          if (formValidationFunc != null) formValidationFunc();
        },
        validator: (value) {
          var inputValidation = AuthInputValidator().validateEmail(value);
          return inputValidation.isValid ? null : inputValidation.message;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'Entrer un mail valide ex : abc@gmail.com'),
      ),
    );
  }

  static getPasswordField(Function formValidationFunc) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      //padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        onChanged: (String value) {
          if (formValidationFunc != null) formValidationFunc();
        },
        validator: (value) {
          var inputValidation = AuthInputValidator().validatePassword(value);

          return inputValidation.isValid ? null : inputValidation.message;
        },
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Entrer un mot de passe sécurisé'),
      ),
    );
  }

  static forgetPasswordButton({@required context}) {
    return FlatButton(
      onPressed: () {
        //TODO FORGOT PASSWORD SCREEN GOES HERE
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PlanListScreen()));
      },
      child: Text(
        'Mot de passe oublié',
        style: TextStyle(color: Colors.blue, fontSize: 15),
      ),
    );
  }

  static authWithEmailAndPasswordButton(
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
              print("logged in");
              return;
            }
            print("registered");
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => PlanListScreen()));
            return;
          }

          print("form is not valid");
        },
        child: Text(
          isLogin ? "Connexion" : "Inscription",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  static loginButton({@required context, @required formValidationFunc}) {
    return authWithEmailAndPasswordButton(
        context: context, formValidationFunc: formValidationFunc);
  }

  static createAccountIfNotExist({@required context}) {
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

  static registerButton({@required context, @required formValidationFunc}) {
    return authWithEmailAndPasswordButton(
        context: context,
        isLogin: false,
        formValidationFunc: formValidationFunc);
  }

  static loginIfAlreadyHaveAccount({context}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      child: Text(
        "Déja un compte ? Se connecter",
        style: TextStyle(color: Colors.blueAccent, fontSize: 15),
      ),
    );
  }

  static loginWithEmailAndPassword() {
    print("loginWithEmailAndPassword");
  }

  static registerWithEmailAndPassword() {
    print("registerWithEmailAndPassword");
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/PlanListScreen/PlanListScreen.dart';

import 'components/createAccountIfNotExist.dart';
import 'components/forgotPasswordButton.dart';
import 'components/getEmailField.dart';
import 'components/getPassword.dart';
import 'components/getSocialIcons.dart';
import 'components/loginButton.dart';
import 'components/showLogo.dart';

class LoginScreen extends StatefulWidget {
  static String pageName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.pushReplacementNamed(context, PlanListScreen.pageName);
      }
      return user;
    });

    final formValidationFunc = () => _formKey.currentState.validate();

    Function _setEmail = (email) => this.setState(() {
          _email = email;
        });
    Function _setPassword = (password) => this.setState(() {
          _password = password;
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              showLogo(),
              getEmailField(_setEmail, null),
              getPasswordField(_setPassword, null),
              forgetPasswordButton(context: context),
              loginButton(
                context: context,
                formValidationFunc: formValidationFunc,
                email: _email,
                password: _password,
              ),
              getSocialsIcons(context: context),
              SizedBox(height: 50),
              createAccountIfNotExist(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/AuthScreensLogic.dart';

class LoginScreen extends StatefulWidget {
  static String pageName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formValidationFunc = () => _formKey.currentState.validate();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              AuthScreensLogic.showLogo(),
              AuthScreensLogic.getEmailField(null),
              AuthScreensLogic.getPasswordField(null),
              AuthScreensLogic.forgetPasswordButton(context: context),
              AuthScreensLogic.loginButton(
                  context: context, formValidationFunc: formValidationFunc),
              AuthScreensLogic.getSocialsIcons(context: context),
              SizedBox(height: 50),
              AuthScreensLogic.createAccountIfNotExist(context: context),
            ],
          ),
        ),
      ),
    );
  }

  loginWithGoogle() {}

  loginWithFacebook() {}
}

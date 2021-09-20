import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/AuthScreensLogic.dart';

class RegisterScreen extends StatefulWidget {
  static String pageName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              AuthScreensLogic.registerButton(
                  context: context, formValidationFunc: formValidationFunc),
              AuthScreensLogic.getSocialsIcons(
                context: context,
                isLogin: false,
              ),
              SizedBox(
                height: 50,
              ),
              AuthScreensLogic.loginIfAlreadyHaveAccount(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/LoginIfAlreadyHaveAccount.dart';
import 'components/forgotPasswordButton.dart';
import 'components/getEmailField.dart';
import 'components/getPassword.dart';
import 'components/getSocialIcons.dart';
import 'components/registerButton.dart';
import 'components/showLogo.dart';

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
              showLogo(),
              getEmailField(null),
              getPasswordField(null),
              forgetPasswordButton(context: context),
              registerButton(
                  context: context, formValidationFunc: formValidationFunc),
              getSocialsIcons(
                context: context,
                isLogin: false,
              ),
              SizedBox(
                height: 50,
              ),
              loginIfAlreadyHaveAccount(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

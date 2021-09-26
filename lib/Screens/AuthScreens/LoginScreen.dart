import 'package:flutter/material.dart';

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
              loginButton(
                  context: context, formValidationFunc: formValidationFunc),
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

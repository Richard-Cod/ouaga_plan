import 'package:flutter/material.dart';

import 'AuthWithEmailAndPasswordButton.dart';

registerButton(
    {@required context,
    @required formValidationFunc,
    String email,
    String password}) {
  return authWithEmailAndPasswordButton(
    context: context,
    isLogin: false,
    formValidationFunc: formValidationFunc,
    email: email,
    password: password,
  );
}

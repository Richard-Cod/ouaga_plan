import 'package:flutter/material.dart';

import 'AuthWithEmailAndPasswordButton.dart';

loginButton(
    {@required context,
    @required formValidationFunc,
    @required String email,
    @required String password}) {
  return authWithEmailAndPasswordButton(
    context: context,
    formValidationFunc: formValidationFunc,
    email: email,
    password: password,
  );
}

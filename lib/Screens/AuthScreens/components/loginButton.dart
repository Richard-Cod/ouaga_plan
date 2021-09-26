import 'package:flutter/material.dart';

import 'AuthWithEmailAndPasswordButton.dart';

loginButton({@required context, @required formValidationFunc}) {
  return authWithEmailAndPasswordButton(
      context: context, formValidationFunc: formValidationFunc);
}

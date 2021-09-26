import 'package:flutter/material.dart';

import 'AuthWithEmailAndPasswordButton.dart';

registerButton({@required context, @required formValidationFunc}) {
  return authWithEmailAndPasswordButton(
      context: context, isLogin: false, formValidationFunc: formValidationFunc);
}

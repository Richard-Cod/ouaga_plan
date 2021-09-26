import 'package:flutter/material.dart';
import 'package:flutter_app/utils/AuthInputValidator.dart';

getPasswordField(Function setValue, Function formValidationFunc) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      onChanged: (String value) {
        if (formValidationFunc != null) formValidationFunc();
        setValue(value);
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

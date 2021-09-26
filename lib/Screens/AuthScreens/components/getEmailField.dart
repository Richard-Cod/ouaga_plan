import 'package:flutter/material.dart';
import 'package:flutter_app/utils/AuthInputValidator.dart';

Widget getEmailField(Function formValidationFunc) {
  return Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      onChanged: (String value) {
        if (formValidationFunc != null) formValidationFunc();
      },
      validator: (value) {
        var inputValidation = AuthInputValidator().validateEmail(value);
        return inputValidation.isValid ? null : inputValidation.message;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Entrer un mail valide ex : abc@gmail.com'),
    ),
  );
}

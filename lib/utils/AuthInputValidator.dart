import 'package:flutter_app/utils/InputValidationState.dart';

const PASSWORD_MIN_LENGTH = 4;

class AuthInputValidator {
  InputValidationState validateEmail(String email) {
    String regex =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

    return InputValidationState(
        RegExp(regex).hasMatch(email), "Email invalide");
  }

  InputValidationState validatePassword(String password) {
    bool isValid = true;
    String message = "Mot de passe invalide";

    if (password.length < PASSWORD_MIN_LENGTH) {
      isValid = false;
      message = "Entrer un mot de passe de 4 caractères au moins";
    }
    return InputValidationState(isValid, message);
  }
}

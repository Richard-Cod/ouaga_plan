// Import the test package and Counter class
import 'package:flutter_app/utils/AuthInputValidator.dart';
import 'package:test/test.dart';

void main() {
  AuthInputValidator authInputValidator;

  setUp(() => {authInputValidator = AuthInputValidator()});

  test('Validator should refuse empty email field', () async {
    const email = "";

    expect(authInputValidator.validateEmail(email).isValid, false);
  });

  test('Validator should refuse bad email field', () async {
    const email = "richa";

    expect(authInputValidator.validateEmail(email).isValid, false);
  });

  test('Validator should refuse email field', () async {
    const email = "richard.bathiebogmail.com";

    expect(authInputValidator.validateEmail(email).isValid, false);
  });

  test('Validator should accept email field', () async {
    const email = "richard.bathiebo@gmail.com";

    expect(authInputValidator.validateEmail(email).isValid, true);
  });

  test('Validator should refuse empty password field', () async {
    const password = "";

    expect(authInputValidator.validatePassword(password).isValid, false);
  });

  test('Validator should refuse short password', () async {
    const password = "bah";

    expect(authInputValidator.validatePassword(password).isValid, false);
  });

  test('Validator should accept password', () async {
    const password = "bahaa";

    expect(authInputValidator.validatePassword(password).isValid, true);
  });
}

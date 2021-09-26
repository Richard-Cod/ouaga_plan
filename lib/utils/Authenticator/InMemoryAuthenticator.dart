import 'package:flutter_app/utils/Authenticator/IAuthenticator.dart';

class InMemorAuthenticator implements IAuthenticator {
  @override
  bool loginWithEmailAndPassword(String email, String password) {
    return true;
  }

  @override
  bool loginWithFacebook() {
    return true;
  }

  @override
  bool loginWithgoogle() {
    return true;
  }

  @override
  bool registerWithEmailAndPassword(String email, String password) {
    return true;
  }

  @override
  bool registerWithFacebook() {
    return true;
  }

  @override
  bool registerWithGoogle() {
    return true;
  }
}

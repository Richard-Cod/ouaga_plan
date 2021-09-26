import 'package:flutter_app/utils/Authenticator/IAuthenticator.dart';

class InMemorAuthenticator implements IAuthenticator {
  @override
  Future<bool> loginWithEmailAndPassword(String email, String password) {
    return Future.delayed(
      duration,
      () => true,
    );
  }

  @override
  Future<bool> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithgoogle() {
    // TODO: implement loginWithgoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> registerWithEmailAndPassword(String email, String password) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> registerWithFacebook() {
    // TODO: implement registerWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }
}

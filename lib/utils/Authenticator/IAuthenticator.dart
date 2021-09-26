const Duration duration = Duration(milliseconds: 100);

var r = Future.delayed(
  duration,
  () => true,
);

class IAuthenticator {
  Future<bool> loginWithEmailAndPassword(String email, String password) {
    return r;
  }

  Future<bool> registerWithEmailAndPassword(String email, String password) {
    return r;
  }

  Future<bool> loginWithgoogle() {
    return r;
  }

  Future<bool> loginWithFacebook() {
    return r;
  }

  Future<bool> registerWithGoogle() {
    return r;
  }

  Future<bool> registerWithFacebook() {
    return r;
  }
}

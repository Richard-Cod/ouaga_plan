import 'package:flutter_app/User/User.dart' as CustomUser;
import 'package:flutter_app/utils/Authenticator/IAuthenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticator implements IAuthenticator {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> loginWithEmailAndPassword(String email, String password) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
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
  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      print("start try");
      print(email);
      print(password);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      print("end of try");
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("firebase e ");
      print(e);
    }
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

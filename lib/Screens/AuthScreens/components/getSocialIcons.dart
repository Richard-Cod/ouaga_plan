import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Authenticator/IAuthenticator.dart';
import 'package:flutter_app/utils/Authenticator/InMemoryAuthenticator.dart';

IAuthenticator authenticator = InMemorAuthenticator();

Widget buildSocialButton(Image image, Function loginFunc) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    child: InkWell(onTap: () => loginFunc(), child: image),
  );
}

Widget getSocialsIcons({@required context, bool isLogin = true}) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    width: MediaQuery.of(context).size.width * 0.7,
    // color: Colors.blueAccent,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialButton(
            Image.asset(
              "assets/icons/google.png",
              height: 40,
            ),
            isLogin ? loginWithGoogle : registerWithGoogle,
          ),
          buildSocialButton(
            Image.asset(
              "assets/icons/facebook.png",
              height: 40,
            ),
            isLogin ? loginWithFacebook : registerWithFacebook,
          )
        ],
      ),
    ),
  );
}

loginWithGoogle() {
  try {
    print("loginWithGoogle");
    authenticator.loginWithgoogle();
  } catch (e) {
    print(e);
  }
}

loginWithFacebook() {
  try {
    print("loginWithFacebook");
    authenticator.loginWithFacebook();
  } catch (e) {
    print(e);
  }
}

registerWithGoogle() {
  try {
    print("registerWithGoogle");
    authenticator.registerWithGoogle();
  } catch (e) {
    print(e);
  }
}

registerWithFacebook() {
  try {
    print("registerWithFacebook");
    authenticator.registerWithFacebook();
  } catch (e) {
    print(e);
  }
}

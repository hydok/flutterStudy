import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_study_app/tab_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign in',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(30)),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () {
                //메소드 비동기 실행
                _handleSignin().then((user) {
                  //화면 전환시 user 객체 전달
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TabPage(user)));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  //로그인 비동
  Future<FirebaseUser> _handleSignin() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = (await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken))).user;
    print('sign in' + user.displayName);
    return user;
  }
}

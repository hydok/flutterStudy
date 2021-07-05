import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/tab_page.dart';

import 'login_page.dart';

// 로그인 되어있는지 확인 해야함...
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged, //firebase auto 상태변화 반응..(로그인 및 로그아웃시)
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        /*if (snapshot.connectionState == ConnectionState.waiting) {
          return LoginPage();
        } else {*/
        if (snapshot.hasData) {
          //firebase data가 있을경우
          return TabPage(snapshot.data);
        } else {
          return LoginPage();
        }
        //}
      },
    );
  }
}

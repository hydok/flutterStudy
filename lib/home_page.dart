import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'instagram clon',
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                Text('app 에 오신 것을 환영합니다', style: TextStyle(fontSize: 24)),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  '사진과 동영상을 보려면 팔로우 하세요',
                ),
                Padding(padding: EdgeInsets.all(20.0)),
                SizedBox(
                  width: 260,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10.0)),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoUrl),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          Text(
                            user.email,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.all(5.0)),
                          Text(user.displayName),
                          Padding(padding: EdgeInsets.all(5.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile21.uf.tistory.com%2Fimage%2F243BC54E58836113053A20',
                                    fit: BoxFit.cover),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile21.uf.tistory.com%2Fimage%2F243BC54E58836113053A20',
                                    fit: BoxFit.cover),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile21.uf.tistory.com%2Fimage%2F243BC54E58836113053A20',
                                    fit: BoxFit.cover),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(5.0)),
                          Text('Facebook 친구'),
                          Padding(padding: EdgeInsets.all(10.0)),
                          RaisedButton(
                            child: Text('팔로우'),
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

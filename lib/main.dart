import 'package:flutter/material.dart';
import 'package:flutter_study_app/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: RootPage(),
    );
  }
}


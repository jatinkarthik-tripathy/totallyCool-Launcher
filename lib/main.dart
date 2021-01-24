import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launcher/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF202124),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launcher',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xFF202124),
        primaryColor: Color(0xFF167D7F),
        accentColor: Color(0xFF29A0B1),
      ),
      home: MyHomePage(),
    );
  }
}

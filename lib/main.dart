import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launcher/screens/apps.dart';
import 'package:launcher/screens/eisenhowerMatrix.dart';
import 'package:launcher/screens/home.dart';
import 'package:launcher/screens/todo.dart';
import 'package:launcher/utils/dbUtilsClass.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBUtilsClass.initDatabase();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF202124),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor myColor = MaterialColor(
    0xFF29A0B1,
    {
      50: Color(0xFF29A0B1),
      100: Color(0xFF29A0B1),
      200: Color(0xFF29A0B1),
      300: Color(0xFF29A0B1),
      400: Color(0xFF29A0B1),
      500: Color(0xFF29A0B1),
      700: Color(0xFF29A0B1),
      800: Color(0xFF29A0B1),
      900: Color(0xFF29A0B1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launcher',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Poppins",
        primarySwatch: myColor,
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF202124),
        primaryColor: Colors.grey[400],
        accentColor: Color(0xFF29A0B1),
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyHomePage(),
        '/apps': (BuildContext context) => Apps(),
        '/todo': (BuildContext context) => ToDo(),
        '/matrix': (BuildContext context) => EisenhowerMatrix(),
      },
    );
  }
}

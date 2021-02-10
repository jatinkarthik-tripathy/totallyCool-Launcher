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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor myColor = MaterialColor(
    0xFF008080,
    {
      50: Color(0xFF008080),
      100: Color(0xFF008080),
      200: Color(0xFF008080),
      300: Color(0xFF008080),
      400: Color(0xFF008080),
      500: Color(0xFF008080),
      700: Color(0xFF008080),
      800: Color(0xFF008080),
      900: Color(0xFF008080),
    },
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF000000),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: 'Launcher',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Poppins",
        primarySwatch: myColor,
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        primaryColor: Colors.blueGrey[300],
        accentColor: Color(0xFF008080),
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

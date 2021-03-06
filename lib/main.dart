import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/screen/start_screen.dart';

void main() => runApp(FlutterAppWidgetTest());

class FlutterAppWidgetTest extends StatelessWidget {
  int num;

  @override
  Widget build(BuildContext context) {
    num ??= 0;
    num == 8 ? num = 9 : num = 7;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(

        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.grey[300],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Colors.green,
            size: 24,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.green,
            fontSize: 12,
          ),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.orange,
          unselectedIconTheme: IconThemeData(
            color: Colors.lightGreen,
            size: 24,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 12,
          ),
        ),),
      home: StartPage(),
    );
  }
}




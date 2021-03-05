import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/screen/start_screen.dart';

void main() => runApp(FlutterAppWidgetTest());

class FlutterAppWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.grey[300],

      ),
      home: StartPage(),
    );
  }
}
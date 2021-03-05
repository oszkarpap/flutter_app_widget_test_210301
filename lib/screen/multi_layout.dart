import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/button.dart';
import 'package:flutter_app_widget_test_210301/screen/page_view.dart';
import 'package:flutter_app_widget_test_210301/main.dart';

class MultiLayout extends StatefulWidget {
  @override
  _MultiLayoutState createState() => _MultiLayoutState();
}

class _MultiLayoutState extends State<MultiLayout> {
  double _width = 300;
  double _height = 300;
  double _blur = 0.0;
  Color _color = Colors.green.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Layout Builder and friends'),
      ),
      body: Container(
        width: _width,
        height: _height,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxHeight > _height &&
                constraints.maxWidth > _width) {
              return largeScreen();
            } else {
              return mediumScreen();
            }
          },
        ),
      ),
    );
  }

  Column largeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: Container(
            width: _width - 100,
            height: _height - 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/load.png'),
                //image: AssetImage('https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
              child: Container(
                color: _color,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column mediumScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
            'https://i.picsum.photos/id/217/200/300.jpg?grayscale&hmac=cltiYxnYprW35wYDYGu8WaxUPaJ3iQYNMQaaU-gMHjU')
      ],
    );
  }
}

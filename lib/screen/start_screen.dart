import 'dart:math';
import 'package:flutter_app_widget_test_210301/screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/button.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_app_widget_test_210301/screen/second_screen.dart';
import 'package:flutter_app_widget_test_210301/screen/multi_layout.dart';
import 'package:flutter_app_widget_test_210301/screen/listview_screen.dart';
import 'package:flutter_app_widget_test_210301/screen/third_screen.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  static const double columnPaddingEdgeInsets = 16.0;
  static const double mySizedBoxSize = 64.0;
  Random random = new Random();
  int incrementer = 1;
  final items = List<String>.generate(100, (i) => "Item $i");

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    int game = random.nextInt(1000).toInt();
    var _screenSize = MediaQuery.of(context).size;
    var _deviceOrientatio = MediaQuery.of(context).orientation;
    var _textSclaefactor = MediaQuery.of(context).textScaleFactor;
    var _screenContrast = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text('WIDGET TEST')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("DRAWER")),
            ListTile(
              title: Text('#1'),
            ),
            ListTile(
              title: Text('#2'),
            ),
            ListTile(
              title: Text('#3'),
            ),
            ListTile(
              title: Text('#4'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(columnPaddingEdgeInsets),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: MyButton(
                      buttonName: "TAB",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TabsPage()),
                        );
                      },
                      buttonColor: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: MyButton(
                      buttonName: "Expand 02 + SB",
                      onPressed: () {
                        scaffoldKey.currentState

                            .showSnackBar(SnackBar(content: Text("HELLÓ!")));
                      },
                      buttonColor: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 100,
              thickness: 2,
              color: Colors.green,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: mySizedBoxSize,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.rotate(
                  angle: -(pi / 4),
                  child: Flexible(
                    flex: 1,
                    child: MyButton(
                      buttonName: "Listview",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListViewScreen()));
                      },
                      buttonColor: Colors.pinkAccent,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: MyButton(
                    buttonName: "Flex + 2.oldal",
                    onPressed: () {
                      MyNav();
                    },
                    buttonColor: Colors.orangeAccent,
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Transform.translate(
                    offset: Offset(-50, -50),
                    child: Flexible(
                      flex: 2,
                      child: MyButton(
                        buttonName: "Flx+Ignrd",
                        onPressed: () {
                          MyNav();
                        },
                        buttonColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mySizedBoxSize,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(textDirection: TextDirection.rtl, children: <Widget>[
                MyButton(
                  buttonName: "Wrap_01",
                  onPressed: () {
                    MyNav();
                  },
                  buttonColor: Colors.brown,
                ),
                MyButton(
                  buttonName: "Wrap_02",
                  onPressed: () {
                    MyNav();
                  },
                  buttonColor: Colors.green,
                ),
                MyButton(
                  buttonName: "Wrap_03",
                  onPressed: () {
                    MyNav();
                  },
                  buttonColor: Colors.lightGreenAccent,
                ),
                MyButton(
                  buttonName: "Wrap_04",
                  onPressed: () {
                    MyNav();
                  },
                  buttonColor: Colors.deepPurple,
                ),
                Row(children: <Widget>[
                  Container(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "Screen size: " +
                                _screenSize.toString() +
                                ",\nContrast" +
                                _screenContrast.toString() +
                                ",\nOrientation: " +
                                _deviceOrientatio.toString() +
                                ",\nText Scale: " +
                                _textSclaefactor.toString(),
                            style: TextStyle(color: Colors.blue))),
                  ),
                  GestureDetector(
                    onTap: () {
                      MyNav();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Positioned(
                          bottom: 20.0,
                          child: Center(
                              child: Hero(
                                  tag: "hero",
                                  child: Icon(
                                    Icons.access_alarm,
                                    color: Colors.blueAccent,
                                    size: 32,
                                  ))),
                        ),
                      ),
                    ),
                  ),
                ])
              ]),
            ),
            Center(
                child: Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  height: 200.0,
                  width: 200.0,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Tooltip(
                      message: 'and Tooltip',
                      child: MyButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MultiLayout()));
                        },
                        buttonName: 'FttdBx+ML',
                        buttonColor: Colors.blue,
                      ),
                    ),
                  )),
            ])),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Draggable(
                    data: game,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Center(
                        child: Text(
                          game.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                      color: Colors.pink,
                    ),
                    feedback: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Center(
                        child: Text(
                          game.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.green,
                        child: DragTarget(
                          builder:
                              (context, List<int> candidateData, rejectedData) {
                            print(candidateData);
                            return Center(
                                child: Text(
                              "%7 == 0",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0),
                            ));
                          },
                          onWillAccept: (data) {
                            return true;
                          },
                          onAccept: (data) {
                            if (data % 7 == 0) {
                              scaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text("OK!")));
                            } else {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text("NEM!")));
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.deepPurple,
                        child: DragTarget(
                          builder:
                              (context, List<int> candidateData, rejectedData) {
                            return Center(
                                child: Text(
                              "%7 != 0",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0),
                            ));
                          },
                          onWillAccept: (data) {
                            return true;
                          },
                          onAccept: (data) {
                            if (data % 7 != 0) {
                              scaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text("OK!")));
                            } else {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text("NEM!")));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    width: 300.0,
                    height: 400.0,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${items[index]}',
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.deepOrange,
                        child: ListTile(
                          leading: Icon(Icons.account_balance),
                          title: SelectableText(
                            'MADÁR az ász',
                            toolbarOptions:
                                ToolbarOptions(copy: true, selectAll: true),
                          ),
                          trailing: Icon(Icons.style),
                          subtitle: Text("Tovább a 3. oldalra"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThirdPage()),
                            );
                          },
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void MyNav() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

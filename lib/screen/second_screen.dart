import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/button.dart';
import 'package:flutter_app_widget_test_210301/screen/page_view.dart';
import 'package:flutter_app_widget_test_210301/listview_card.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  static const double secondPageEdgeInsets = 32.0;
  static const double secondPageIconSize = 32.0;
  static const Color mainColor = Colors.green;
  static const _myDuration = Duration(seconds: 3);
  static const double iconSize = 16.0;
  Color oldColor = Colors.green;
  Color _myNewColor = Colors.white;
  double myBorderWidth = 0.0;
  List<String> alphabetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];
  double _value = 1;
  int _indexedNumber = 0;
  double _opacity = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SECOND PAGE')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(

            icon: Icon(
              Icons.arrow_back,
              //color: mainColor,
            ),
            title: Text(
              'Back',
              //style: TextStyle(color: mainColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_forward,
              //color: mainColor,
            ),
            title: Text(
              'Forward',
              //style: TextStyle(color: mainColor),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(secondPageEdgeInsets),
                  child: Hero(
                      tag: "hero",
                      child: Icon(
                        Icons.alarm,
                        color: mainColor,
                        size: secondPageIconSize * 3,
                      )),
                ),
              ),
            ),
            SafeArea(
              minimum: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(color: mainColor),
                child: Text(
                    "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              ),
            ),
            Center(
              child: AnimatedContainer(
                duration: _myDuration,
                decoration: BoxDecoration(
                  color: oldColor,
                  border: Border.all(
                    color: Color(0xFF12569A),
                    width: myBorderWidth,
                  ),
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Wrap(children: <Widget>[
              MyButton(
                  onPressed: () {
                    setState(() {
                      oldColor = _myNewColor;
                      myBorderWidth = 10.0;
                    });
                  },
                  buttonName: "Animated",
                  buttonColor: mainColor),
              Opacity(
                  opacity: 0.2,
                  child: MyButton(
                      onPressed: () {
                        setState(() {
                          oldColor = mainColor;
                          myBorderWidth = 15.0;
                        });
                      },
                      buttonName: "Opacity",
                      buttonColor: mainColor)),
            ]),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Icon(
                        Icons.account_box,
                        color: mainColor,
                        size: iconSize,
                      ),
                      Text(
                        'Profil',
                        style: TextStyle(color: mainColor),
                      )
                    ]),
                    Column(children: [
                      Icon(
                        Icons.settings,
                        color: mainColor,
                        size: iconSize,
                      ),
                      Text(
                        'Beállítás',
                        style: TextStyle(color: mainColor),
                      )
                    ]),
                    Column(children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: mainColor,
                        size: iconSize,
                      ),
                      Text(
                        'Ötletek',
                        style: TextStyle(color: mainColor),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Icon(
                      Icons.cake,
                      color: mainColor,
                      size: iconSize,
                    ),
                    Icon(
                      Icons.voice_chat,
                      color: mainColor,
                      size: iconSize,
                    ),
                    Icon(
                      Icons.add_location,
                      color: mainColor,
                      size: iconSize,
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.lightBlue[200],
              child: Placeholder(
                color: mainColor,
              ),
            ),
            LimitedBox(
              maxWidth: 40.0,
              maxHeight: 40.0,
              child: AspectRatio(
                aspectRatio: 6 / 2,
                child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonName: "BACK",
                    buttonColor: oldColor),
              ),
            ),
            LimitedBox(
              maxHeight: 500,
              maxWidth: 100,
              child: ReorderableListView(
                onReorder: _onReorder,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                children: List.generate(
                  alphabetList.length,
                  (index) {
                    return ListViewCard(
                      alphabetList,
                      index,
                      Key('$index'),
                    );
                  },
                ),
              ),
            ),
            AnimatedPadding(
              padding: EdgeInsets.all(_value),
              duration: const Duration(seconds: 1),
              child: MyButton(
                  onPressed: () {
                    setState(() {
                      if (_value < 100) {
                        _value++;
                      }
                    });
                  },
                  buttonName: _value.toString(),
                  buttonColor: mainColor),
            ),
            Wrap(children: [
              FractionallySizedBox(
                widthFactor: 0.3,
                child: MyButton(
                    onPressed: () {},
                    buttonName: "0.3",
                    buttonColor: mainColor),
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: MyButton(
                    onPressed: () {},
                    buttonName: "0.7",
                    buttonColor: mainColor),
              ),
            ]),
            Wrap(children: [
              IndexedStack(
                index: _indexedNumber,
                children: <Widget>[
                  Container(
                      width: 200,
                      height: 200,
                      color: Colors.pink,
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
                  Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
                  Container(
                      width: 200,
                      height: 200,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        '3',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
                ],
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 5),
                child: MyButton(
                    onPressed: () {
                      setState(() {
                        if (_indexedNumber < 2) {
                          _indexedNumber++;
                        }
                        _opacity = 0.1;
                      });
                    },
                    buttonName: "Change",
                    buttonColor: mainColor),
              ),
            ]),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Text(
          "PV",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mainColor,
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageViewDemo()),
            );
          });
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }

  Container MyContainer(Color color, Color borderColor) {
    decoration:
    BoxDecoration(
      color: color,
      border: Border.all(
        color: borderColor,
        width: myBorderWidth,
      ),
    );
  }
}

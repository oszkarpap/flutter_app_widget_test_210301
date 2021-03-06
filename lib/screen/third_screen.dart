import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/button.dart';
import 'package:flutter_app_widget_test_210301/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  bool _first = true;
  double _sliderValue = 10.0;
  List<bool> _isSelected = List.generate(3, (_) => false);
  List<bool> _selections = [false, true, false];
  static final colorTween = ColorTween(begin: Colors.white, end: Colors.red);
  final items = List<String>.generate(100, (i) => "Item $i");
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    _currentAddress ??= "nincs adat!";
    ContainerTransitionType _containerTransitionType =
        ContainerTransitionType.fade;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('THIRD SCREEN')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OpenContainer(
                transitionType: _containerTransitionType,
                transitionDuration: Duration(seconds: 1),
                openBuilder: (BuildContext context, VoidCallback _) {
                  return Container(
                    width: 200,
                    height: 200,
                    child: Center(
                        child: MyButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      buttonColor: Colors.red,
                      buttonName: "PAFF",
                    )),
                  );
                },
                closedElevation: 0,
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: Colors.white, width: 1)),
                closedColor: Colors.blue,
                closedBuilder: (context, _) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Click Me",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_currentAddress),
                    AnimatedPhysicalModel(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      elevation: _first ? 5.0 : 10.0,
                      shape: BoxShape.rectangle,
                      shadowColor: Colors.grey,
                      color: _first ? Colors.lightGreen : Colors.green[900],
                      borderRadius: _first
                          ? const BorderRadius.all(Radius.circular(10))
                          : const BorderRadius.all(Radius.circular(30)),
                      child: MyButton(
                        buttonName: ("Get location"),
                        onPressed: () {
                          setState(() {
                            _first = !_first;
                          });
                          _getCurrentLocation();
                        },
                        buttonColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                'Iskola',
                style: MyTextStyle2,
              )),
            ),
            DataTable(
              sortColumnIndex: 0,
              sortAscending: true,
              columns: [
                DataColumn(
                    label: Text(
                      'No',
                      style: MyTextStyle,
                    ),
                    numeric: true),
                DataColumn(
                    label: Text(
                  'Név',
                  style: MyTextStyle,
                )),
                DataColumn(
                    label: Text(
                  'Tantárgy',
                  style: MyTextStyle,
                )),
              ],
              rows: [
                DataRow(selected: true, cells: [
                  DataCell(
                    Text(
                      '2',
                      style: MyTextStyle2,
                    ),
                    showEditIcon: true,
                  ),
                  DataCell(
                      Text(
                        'Anett',
                        style: MyTextStyle2,
                      ),
                      placeholder: true),
                  DataCell(Text(
                    'Biológia',
                    style: MyTextStyle2,
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    '9',
                    style: MyTextStyle2,
                  )),
                  DataCell(Text(
                    'Betti',
                    style: MyTextStyle2,
                  )),
                  DataCell(Text(
                    'Matematika',
                    style: MyTextStyle2,
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    '5',
                    style: MyTextStyle2,
                  )),
                  DataCell(Text(
                    'Cili',
                    style: MyTextStyle2,
                  )),
                  DataCell(Text(
                    'Testnevelés',
                    style: MyTextStyle2,
                  )),
                ]),
              ],
            ),
            Slider(
              activeColor: Colors.indigoAccent,
              min: 0.0,
              max: 15.0,
              onChanged: (newRating) {
                setState(() => _sliderValue = newRating);
              },
              value: _sliderValue,
            ),
            MyButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("TEST Alert Dialog"),
                      content: Text(
                          "Valamiért nem műküdik a sliderem! => osztályváltozó"),
                      actions: <Widget>[
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("KATT"),
                        ),
                      ],
                    ),
                  );
                },
                buttonName: "ALERT DIALOG",
                buttonColor: Colors.red),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                children: [
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: const FlutterLogo(
                        style: FlutterLogoStyle.horizontal, size: 100.0),
                    secondChild: const FlutterLogo(
                        style: FlutterLogoStyle.stacked, size: 100.0),
                    crossFadeState: _first
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  MyButton(
                      onPressed: () {
                        setState(() {
                          _first = !_first;
                        });
                      },
                      buttonName: "ACF",
                      buttonColor: Colors.amber)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                children: <Widget>[
                  Icon(Icons.add_comment),
                  Icon(Icons.airline_seat_individual_suite),
                  Icon(Icons.add_location),
                ],
                isSelected: _selections,
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                children: <Widget>[
                  Icon(Icons.bluetooth),
                  Icon(Icons.wifi),
                  Icon(Icons.flash_on),
                ],
                isSelected: _isSelected,
                onPressed: (int index) {
                  setState(() {
                    _isSelected[index] = !_isSelected[index];
                  });
                },
                // region example 1
                color: Colors.grey,
                selectedColor: Colors.red,
                fillColor: Colors.lightBlueAccent,
                // endregion
                // region example 2
                borderColor: Colors.lightBlueAccent,
                selectedBorderColor: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // endregion
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                child: Text('Cupertino Action Button'),
                onPressed: () => _show(context),
              ),
            ),
            ColorFiltered(
              child: Image.asset('images/sun.png'),
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
            Center(
              child: TweenAnimationBuilder<Color>(
                tween: colorTween,
                duration: Duration(seconds: 10),
                builder: (_, Color color, __) {
                  return ColorFiltered(
                    child: Image.asset('images/sun.png'),
                    colorFilter: ColorFilter.mode(color, BlendMode.modulate),
                  );
                },
              ),
            ),
            ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.green, Colors.blue],
                  ).createShader(bounds);
                },
                child: Image.asset('images/sun.png')),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Image.network(
                  'https://i.ibb.co/1vXpqVs/flutter-logo.jpg',
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
              child: CheckboxListTile(
                title: const Text('First'),
                subtitle: const Text('CheckBoxListTile'),
                secondary: const Icon(
                  Icons.web,
                ),
                tileColor: Colors.black,
                activeColor: Colors.red,
                checkColor: Colors.yellow,
                selected: _isChecked,
                value: _isChecked,
                onChanged: (bool value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
              ),
            ),
            MyButton(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationName: 'APP NAME',
                    applicationVersion: 'APP VERSION',
                    applicationLegalese: 'APP Legalese',
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('Üzenet helye'))
                    ],
                  );
                },
                buttonName: "AboutDialog",
                buttonColor: Colors.orangeAccent),
            MyButton(
                onPressed: () async => {},
                buttonName: "URL lancher",
                buttonColor: Colors.blue),
            Container(
              height: 200,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                children: List.generate(50, (index) {
                  return Container(
                    child: Card(
                      color: Colors.amber,
                    ),
                  );
                }),
              ),
            ),
            Center(
              child: Card(
                color: Colors.white,
                child: SwitchListTile(
                  title: Text(
                    'Flutter App',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  value: _first,
                  activeColor: Colors.red,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      _first = value;
                    });
                  },
                  secondary: Image.asset(
                    "images/load.png",
                  ),
                  subtitle: Text(
                    'loading....',
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  void _show(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {}, child: Text('Option #1')),
                CupertinoActionSheetAction(
                    onPressed: () {}, child: Text('Option #2')),
                CupertinoActionSheetAction(
                    onPressed: () {}, child: Text('Option #3')),
                CupertinoActionSheetAction(
                    onPressed: () {}, child: Text('Option #4')),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => _close(ctx),
                child: Text('Close'),
              ),
            ));
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

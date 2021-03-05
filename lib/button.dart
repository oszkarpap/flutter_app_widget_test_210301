import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  MyButton({@required this.onPressed, @required this.buttonName, @required this.buttonColor});

  final GestureTapCallback onPressed;
  final String buttonName;
  final Color buttonColor;

  static const Color buttonTextColor = Colors.white;
  static const double buttonEdgeInsets = 4.0;
  static const double buttonSizeBox = 10.0;

  @override
  Widget build (BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(buttonEdgeInsets),
      child: RawMaterialButton(
        fillColor: buttonColor,
        splashColor: buttonTextColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: buttonEdgeInsets,
              horizontal: buttonEdgeInsets,
          ),
          child: Row(
            mainAxisSize:  MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.account_circle_outlined,
                color: buttonTextColor,
              ),
              const SizedBox(
                width: buttonSizeBox,

              ),
               Text(buttonName,
              style: TextStyle(color: buttonTextColor)),

            ],
          ),
        ),
        onPressed: onPressed,
        shape: const StadiumBorder(),
      ),
    );
  }


}
import 'package:flutter/material.dart';
import 'package:zakira/Utils/colors.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }
}

Widget getBackButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 25, left: 15),
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Container(
          width: Utils().getScreenSize().width * 0.09,
          height: Utils().getScreenSize().height * 0.04,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: orangeColor,
          )),
        )),
  );
}

Widget getCustomButton(String text, onPressed) {
  return Container(
    height: Utils().getScreenSize().height * 0.060,
    width: Utils().getScreenSize().width * 0.6,
    decoration: BoxDecoration(),
    child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(orangeColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
  );
}

Widget getCustomizedButton(double width,double height,Widget child, Color color, Border border) {
  return Material(
    elevation: 3.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, border: border, borderRadius: BorderRadius.circular(30)),
      child: Center(child: child),
    ),
  );
}

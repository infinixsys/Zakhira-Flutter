import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';

 Widget getAppBarButton(Widget icon) {
    return Padding(
        padding: const EdgeInsets.only(top: 25, left: 15),
        child: Container(
          width: Utils().getScreenSize().width * 0.10,
          height: Utils().getScreenSize().height * 0.08,
          decoration: BoxDecoration(
              color: Colors.black38, borderRadius: BorderRadius.circular(50)),
          child: Center(child: icon),
        ));
  }
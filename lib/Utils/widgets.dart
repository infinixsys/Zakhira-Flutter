import 'package:flutter/material.dart';
import 'package:zakira/Utils/colors.dart';

class TextInputField extends StatelessWidget {
  // final - Jab Aapko Pata ho ki ye ab change nahi hoga - const But Widgets/Methods Ke Liye
  final TextEditingController controller;
  final IconData myIcon;
  final String myLabelText;
  final bool toHide;
  TextInputField({
    Key? key,
    required this.controller,
    required this.myIcon,
    required this.myLabelText,
    this.toHide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: toHide,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(myIcon),
        labelText: myLabelText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class SearchBarField extends StatelessWidget {
  String myhint;
  Icon icon;
  TextEditingController controller;

  SearchBarField(
      {super.key,
      required this.controller,
      required this.myhint,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: myhint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: searchBarcolor,
        prefixIcon: icon,
      ),
    );
  }
}

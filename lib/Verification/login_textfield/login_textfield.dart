import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zakira/Utils/Utils.dart';

class LoginTextfieldView extends StatefulWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwoedController = TextEditingController();
   LoginTextfieldView({super.key,required this.phoneController,required this.passwoedController});

  @override
  State<LoginTextfieldView> createState() => _LoginTextfieldViewState();
}

class _LoginTextfieldViewState extends State<LoginTextfieldView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Utils().getScreenSize().width * 0.12,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: Utils().getScreenSize().width * 0.9,
              height: Utils().getScreenSize().height * 0.1,
              child: IntlPhoneField(
                controller: widget.phoneController,
                initialCountryCode: "IN",
                decoration: InputDecoration(
                  
                    labelText: "Phone Number",
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.grey)),
                    fillColor: Colors.white,
                    filled: true),
              ),
            )),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: Utils().getScreenSize().width * 0.9,
            height: Utils().getScreenSize().height * 0.1,
            child: TextFormField(
              obscureText: true,
              controller: widget.passwoedController,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
              validator: (value) {
                if (value!.isNotEmpty){
                  return'please enter your password';
                }else{
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

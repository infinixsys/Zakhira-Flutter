import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/otp_api_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Verification/otp_page.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/Verification/user_info_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SugnUpPageState();
}

class _SugnUpPageState extends State<SignUpPage> {
  String mobileNo = "";
  bool isApiCallProcess = false;
  final _apiService = ApiService();
  final _phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isSendingOtp = false;
  bool _isVerifyingOtp = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneNumberController.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: getBackButton()),
              SizedBox(
                height: Utils().getScreenSize().height * 0.035,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Please enter your \nMobile No.",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "We protect our community by making sure \nThat everyone on Zakhira is real.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: Utils().getScreenSize().width * 0.12,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: Utils().getScreenSize().width * 0.9,
                    height: Utils().getScreenSize().height * 0.1,
                    child: IntlPhoneField(
                      controller: _phoneNumberController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      validator: (p0) {},
                    ),
                  )),
              SizedBox(
                height: Utils().getScreenSize().height * 0.3,
              ),
              Column(
                children: [
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            if (_phoneNumberController.text.length == 10) {
                              setState(() {
                                isLoading = true;
                              });
                              ApiService()
                                  .sendOTP(context, _phoneNumberController.text);
                                  
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Enter Your Mobile Number")));
                            }
                          },
                          child: getCustomizedButton(
                              Utils().getScreenSize().width * 0.8,
                              Utils().getScreenSize().height * 0.07,
                              _isSendingOtp
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Send Otp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                              orangeColor,
                              const Border()))),
                  SizedBox(
                    height: Utils().getScreenSize().height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.manage_accounts,
                          size: 30,
                        ),
                        SizedBox(height: Utils().getScreenSize().height * 0.1),
                        const Text(
                          "We never share this with anyone and it \n won't be on your profile.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.0),

                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // // ***** send otp
}

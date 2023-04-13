import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/otp_api_service.dart';
import 'package:zakira/Utils/colors.dart';

import 'package:zakira/Verification/user_info_screen.dart';

import '../Utils/Utils.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  final String mobileNo;

  const OtpPage({
    super.key,
    required this.mobileNo,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isApiCallProcess = false;
  String errorMessage = '';

  TextEditingController otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(18.0),
    ),
  );

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Enter Otp",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Enter otp code sent to your mobile number  +91-${widget.mobileNo}",
                maxLines: 2,
                style: GoogleFonts.poppins(),
              ),
            ),
            SizedBox(
              height: Utils().getScreenSize().height * 0.06,
            ),
            Center(
              child: Pinput(
                controller: otpController,
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the otp";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.message,
                  size: 30,
                ),
                Text(
                  isApiCallProcess ==true?"Otp Send On Your Mobile Number":"Didn't get a text?",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          isApiCallProcess = true;
                        });
                        ApiService()
                            .sendOTP(context, widget.mobileNo)
                            .then((response) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Otp Send On Your Mobile Number")));
                        });
                        setState(() {
                          isApiCallProcess = false;
                        });
                      });
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(color: orangeColor),
                    ))
              ],
            ),
            SizedBox(
              height: Utils().getScreenSize().height * 0.4,
            ),
            Center(
                child: Column(
              children: [
                getCustomButton(
                  isApiCallProcess == true ? "Verifying.." : "Verify OTP",
                  () {
                    setState(() {
                      isApiCallProcess = true;
                    });
                    ApiService()
                        .verifyOTP(widget.mobileNo, otpController.text)
                        .then((response) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserinfoScreen(mobileNo: widget.mobileNo),
                          ));
                    }).catchError((error) {
                      print(error);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text(error.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                    setState(() {
                      isApiCallProcess = false;
                    });
                  },
                ),
                SizedBox(
                  height: Utils().getScreenSize().height * 0.04,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  // Verify Otp

  // Future<void> verifyOTP(String otp, String phoneNumber) async {
  //   // Set loading state
  //   setState(() {
  //     isApiCallProcess = true;
  //   });

  //   // Send POST request to API
  //   final response = await http.post(
  //     Uri.parse(Config.baseapiUrl + Config.vrifyOtp),
  //     body: jsonEncode(<String, String>{
  //       'otp': otp,
  //       'phone_number': phoneNumber,
  //     }),
  //   );

  //   // Check response status code
  //   if (response.statusCode == 200) {
  //     // OTP verification successful
  //     // Do whatever you need to do here
  //   } else {
  //     // OTP verification failed
  //     // Display error message to user
  //     final message = json.decode(response.body)['message'].toString();
  //     print(response.statusCode);
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text(message),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   // Reset loading state
  //   setState(() {
  //     isApiCallProcess = false;
  //   });
  // }
}

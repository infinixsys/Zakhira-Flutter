import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/Services/config.dart';
import 'package:zakira/Verification/otp_page.dart';

import '../Verification/forgot_password/forgot_otp.dart';
import '../Verification/forgot_password/new_password.dart';

class ApiService {
  Future<void> sendOTP(BuildContext context, String phoneNumber) async {
    final url = Uri.parse(Config.baseapiUrl + Config.sendOtpApi);

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"number": phoneNumber, "type": "register"}));
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously

      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpPage(mobileNo: phoneNumber),
          ));
      print("Send Otp success full");
    } else {
      print('Failed to send OTP.');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  // ---
  Future<void> forgetSendOTP(BuildContext context, String phoneNumber) async {
    final url = Uri.parse(Config.baseapiUrl + Config.sendOtpApi);

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"number": phoneNumber, "type": "forget"}));
    print(response.body);
    if (response.statusCode == 200) {
      print("Send Otp success full");
      print(response.body);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotOtpPage(mobileNo: phoneNumber),
          ));
    } else {
      print('Failed to send OTP.');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }
  }

// --------
  Future<String> verifyOTP(String mobileNumber, String otp) async {
    final response = await http.post(
      Uri.parse(Config.baseapiUrl + Config.vrifyOtp),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'number': mobileNumber,
        'otp': otp,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to verify OTP');
    }
  }

// --------
  Future<String> forgotverifyOTP(
      BuildContext context, String mobileNumber, String otp) async {
    final response = await http.post(
      Uri.parse(Config.baseapiUrl + Config.vrifyOtp),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'number': mobileNumber,
        'otp': otp,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPasswordScreen(mobileNumber: mobileNumber),
          ));
      return response.body;
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text("Invalid Otp"),
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
      return "Something Went wrong";
    }
  }
}

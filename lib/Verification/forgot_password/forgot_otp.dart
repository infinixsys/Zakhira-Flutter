import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:zakira/Services/otp_api_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Verification/forgot_password/new_password.dart';
import 'package:zakira/Verification/user_info_screen.dart';

class ForgotOtpPage extends StatefulWidget {
  String mobileNo;
  ForgotOtpPage({super.key, required this.mobileNo});

  @override
  State<ForgotOtpPage> createState() => _ForgotOtpPageState();
}

class _ForgotOtpPageState extends State<ForgotOtpPage> {
  bool isApiCallProcess = false;
  final otpController = TextEditingController();

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
                  isApiCallProcess == true
                      ? "Otp Send On Your Mobile Number"
                      : "Didn't get a text?",
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Otp Send On Your Mobile Number")));
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
                    ApiService().forgotverifyOTP(
                        context, widget.mobileNo, otpController.text);

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
}

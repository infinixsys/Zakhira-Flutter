import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zakira/Services/otp_api_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Verification/forgot_password/forgot_otp.dart';
import 'package:zakira/Verification/otp_page.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  bool isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
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
                      controller: phoneController,
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
              SizedBox(
                height: Utils().getScreenSize().height * 0.28,
              ),
              Column(
                children: [
                  Center(
                    child: ActionChip(
                        onPressed: () {
                          if (phoneController.text.length == 10) {
                            setState(() {
                              isLoading = true;
                            });
                            ApiService()
                                .forgetSendOTP(context, phoneController.text);
                                setState(() {
                                  isLoading=false;
                                });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Enter Your Mobile Number")));
                          }
                        },
                        backgroundColor: orangeColor,
                        pressElevation: 4.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: Utils().getScreenSize().width * 0.3),
                        elevation: 4.0,
                        disabledColor: orangeColor,
                        label: isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Send OTP",
                                style: TextStyle(color: Colors.white),
                              )),
                  ),
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

  // void sendOTP() async {
  //   try {
  //     http.Response response =
  //         await ApiService().forgotSendOTP(phoneController.text);
  //     if (response.statusCode == 200) {
  //       // OTP sent successfully
  //       // Navigate to the OTP verification screen
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ForgotOtpPage(mobileNo: phoneController.text),
  //         ),
  //       );
  //     } else {
  //       // Failed to send OTP
  //       // Show an error message
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Error'),
  //             content: Text('Failed to send OTP'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('OK'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   } catch (e) {
  //     // Something went wrong
  //     // Show an error message
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Failed to send OTP: $e'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }
}

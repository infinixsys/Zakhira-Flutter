import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/login_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Verification/forgot_password/forget_password.dart';
import 'package:zakira/Verification/login_textfield/login_textfield.dart';
import 'package:zakira/Verification/sign_up_page.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  bool isLoading = true;
  bool isLoggedIn = false;

  String phoneNumber = '';
  String pasword = '';
  bool showOnboardingScreen = true;
  String? mtoken;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  setDeviceToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('fcmToken', token);
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setDeviceToken(token);
      setState(() {
        mtoken = token;
        print('My FCMtoken is: $mtoken');
      });
      //saveToken(token!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Utils().getScreenSize().height * 0.08,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Please enter your \nLogin details.",
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
              LoginTextfieldView(
                phoneController: phoneController,
                passwoedController: passwordController,
              ),
              Column(
                children: [
                  Center(
                    child: getCustomButton("Login", () {
                      if (phoneController.text != "" &&
                          passwordController.text != "") {
                        LoginService()
                            .loginWithPhone(phoneController.text,
                                passwordController.text, context)
                            .then((response) {
                          setState(() {
                            isLoggedIn=true;
                            showOnboardingScreen=false;
                          });
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Enter Login Details")));
                      }
                      //           Navigator.pushAndRemoveUntil(
                      // context,
                      // MaterialPageRoute(
                      //   builder: (context) => const HomeScreen(),
                      // ),
                      // (route) => false);
                    }),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ));
                    },
                    child: Text("Forgot password"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ));
                          },
                          child: Text("SignUp"))
                    ],
                  ),
                  SizedBox(
                    height: Utils().getScreenSize().height * 0.1,
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
}

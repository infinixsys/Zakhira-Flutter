import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Verification/login_page.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/View/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  bool isLoggedIn = false;
  String accessToken = "";
  String phoneNumber = '';
  String pasword = '';
  bool showOnboardingScreen = true;
  String name = "";

  Status() {}
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('accesstoken')) {
      setState(() {
        isLoading = false;
        isLoggedIn = true;
        accessToken = prefs.getString('accesstoken')!;
        name = prefs.getString("name")??"";
        showOnboardingScreen = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isLoggedIn = false;
        showOnboardingScreen = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => showOnboardingScreen
                    ? OnboardingScreen()
                    : isLoggedIn
                        ? HomeScreen()
                        : LoginPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: Utils().getScreenSize().height * 0.3),
            height: Utils().getScreenSize().height,
            width: Utils().getScreenSize().width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  scale: 1.5, image: AssetImage("assets/Zakhira_logo.png")),
            ),
          )
        ],
      ),
    );
  }
}

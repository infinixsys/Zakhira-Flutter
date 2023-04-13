import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Verification/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              getOnboardingImg("ZAKIRA\nSince 20XX", "https://cdn.searchenginejournal.com/wp-content/uploads/2022/08/google-shopping-ads-6304dccb7a49e-sej.png",
                  "Discover,\nthe Best Shopping\nDeals by Million of People only on Zakhira"),
              getOnboardingImg("ZAKIRA\nSince 20XX", "https://joburg.co.za/wp-content/uploads/2020/07/10.jpg",
                  "Discover,\nthe Best Shopping\nDeals by Million of People only on Zakhira"),
              getOnboardingImg("ZAKIRA\nSince 20XX", "https://i0.wp.com/stanzaliving.wpcomstaging.com/wp-content/uploads/2022/05/Malls-in-Mumbai.jpg?fit=1000%2C678&ssl=1",
                  "Discover,\nthe Best Shopping\nDeals by Million of People only on Zakhira"),
            
            ],
          ),
          Container(
              padding: const EdgeInsets.only(top: 50),
              alignment: const Alignment(0, .6),
              child: SmoothPageIndicator(
                  effect: const CustomizableEffect(
                      dotDecoration: DotDecoration(
                          height: 8,
                          width: 8,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white38),
                      activeDotDecoration: DotDecoration(
                          height: 10,
                          width: 28,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white)),
                  controller: _pageController,
                  count: 3)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.only(left: 35, right: 35),
        height: Utils().getScreenSize().height * 0.08,
        width: Utils().getScreenSize().width * 0.35,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (Context) => LoginPage()));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 28.0,
            )),
      ),
    ));
  }

  getOnboardingImg(String text, String img, String title) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: Utils().getScreenSize().height,
            width: Utils().getScreenSize().width,
            decoration: BoxDecoration(
                color: onBoarding1color,
                image:
                    DecorationImage(fit: BoxFit.cover, image: NetworkImage(img))),
            child: Container(
              height: Utils().getScreenSize().height,
              width: Utils().getScreenSize().width,
              color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Text(text,
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                    ),
                    SizedBox(
                      height: Utils().getScreenSize().height * 0.3,
                    ),
                    Column(
                      children: [
                        Text(title,
                            style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

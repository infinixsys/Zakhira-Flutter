import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/colors.dart';

import '../../Utils/Utils.dart';

class AppFeedbackScreen extends StatelessWidget {
  AppFeedbackScreen({super.key});
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("App Feedback", style: GoogleFonts.poppins()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        "Send Feedback",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Tell us what you love about the app , or what we could be doing better.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                          width: Utils().getScreenSize().width * 0.9,
                          height: Utils().getScreenSize().height * 0.075,
                          child: TextFormField(
                            controller: feedbackController,
                            decoration:
                                InputDecoration(labelText: "Enter feedback"),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: getCustomizedButton(
                    Utils().getScreenSize().width * 0.9,
                    Utils().getScreenSize().height * 0.06,
                    Text(
                      "Send Feedback",
                      style: TextStyle(color: Colors.white),
                    ),
                    orangeColor,
                    Border()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

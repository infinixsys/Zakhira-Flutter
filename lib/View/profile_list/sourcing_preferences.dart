import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class SourcingPreferenceScreen extends StatefulWidget {
  const SourcingPreferenceScreen({super.key});

  @override
  State<SourcingPreferenceScreen> createState() =>
      _SourcingPreferenceScreenState();
}

class _SourcingPreferenceScreenState extends State<SourcingPreferenceScreen> {
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:
            Text("Personalize Your Experiance", style: GoogleFonts.poppins()),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is your preference?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Select your sourcing prefrence. You can always change this in 'ZAKIRA'. ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  getCustomeRow("Ready-to-ship products"),
                  getCustomeRow("Customizable products"),
                  getCustomeRow("Both"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {},
              child: getCustomizedButton(
                  Utils().getScreenSize().width * 0.85,
                  Utils().getScreenSize().width * 0.12,
                  Text("Done", style: TextStyle(color: Colors.white)),
                  orangeColor,
                  Border()),
            ),
          ),
        ],
      )),
    );
  }

  getCustomeRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Card(
        elevation: 3,
        child: Row(children: [
          Radio<int>(
            value: 3,
            groupValue: _radioVal,
            onChanged: (int? value) {
              if (value != value) {
                setState(() {
                  this._radioVal = value!;
                });
              }
            },
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}

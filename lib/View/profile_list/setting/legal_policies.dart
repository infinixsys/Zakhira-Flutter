import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/View/profile_list/setting/Notification_screen.dart';
import 'package:zakira/View/profile_list/setting/legalpolicys/about_us.dart';
import 'package:zakira/View/profile_list/setting/legalpolicys/privacy_policy.dart';

class LegalPoliciesScreen extends StatelessWidget {
  const LegalPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Legal Policies", style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          getPoliciesTile(Text("Terms of License and Use"), () {}),
          getPoliciesTile(Text("Privacy Policy"), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const PrivacyPolicyView() ,));
          }),
          getPoliciesTile(Text("Cookie"), () {}),
          getPoliciesTile(Text("Abou Us"), () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>const AboutUsView() ,));
          }),
        ],
      ),
    );
  }

Widget  getPoliciesTile(Text mytitle, onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: mytitle,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/View/profile_list/setting/setting_page.dart';

class BrowseAllHotTopics extends StatelessWidget {
  const BrowseAllHotTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Help Center", style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "All help topics",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
            Divider(),
            getSettingListTile(Text("Order Status & Delivery"), Icon(Icons.arrow_forward_ios_rounded),(){}),
          ],
        ),
      ),
    );
  }
}

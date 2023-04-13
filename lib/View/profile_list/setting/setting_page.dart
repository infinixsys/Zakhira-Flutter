import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Verification/login_page.dart';
import 'package:zakira/View/profile_list/setting/Notification_screen.dart';
import 'package:zakira/View/profile_list/setting/legal_policies.dart';
import 'package:zakira/View/profile_list/setting/rate_app.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String countryFlag = "";
  String countryCurrency = "";
  bool isLoading = true;
  bool isLoggedIn = false;
  String accessToken = "";

  bool showOnboardingScreen = true;
  String name = "";

  // ------ signOut function----

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("accesstoken");
    await prefs.remove("name");
    setState(() {
      isLoggedIn = false;
      accessToken = "";
      name = "";
      showOnboardingScreen = true;
    });
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text("Settings", style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getSettingListTile(Text("Ship to"), Text(countryFlag.toString()),
                () {
              showCountryPicker(
                countryListTheme: CountryListThemeData(
                    bottomSheetHeight: Utils().getScreenSize().height * 0.7),
                context: context,
                onSelect: (Country value) {
                  setState(() {
                    countryFlag = value.flagEmoji.toString();
                  });
                },
              );
            }),
            getSettingListTile(
                Text("Currency"),
                Text(
                  countryCurrency.toString(),
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ), () {
              showCurrencyPicker(
                context: context,
                onSelect: (Currency value) {
                  countryCurrency = value.code.toString();
                  setState(() {});
                },
              );
            }),
            getSettingListTile(
                Text("Language"),
                Text(
                  "English",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
                () {}),
            getSettingListTile(Text("Notification"), Text(""), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ));
            }),
            getSettingListTile(Text("Delete account"), Text(""), () {}),
            Divider(
              color: bgcolor,
              thickness: 2.0,
            ),
            getSettingListTile(Text("Legal policies"), Text(""), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LegalPoliciesScreen(),
                  ));
            }),
            getSettingListTile(Text("Rate the app"), Text(""), () {
              _scaffoldKey.currentState?.showBottomSheet(
                  elevation: 3, (context) => const RateAppScreen());
            }),
            getSettingListTile(Text("Clear app cache"), Text(""), () {}),
            SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Sign Out"),
                        content: Text("Are you sure?"),
                        actions: [
                          TextButton(
                            child: Text("No"),
                            onPressed: () {
                              Navigator.of(context).pop(); // dismiss the dialog
                            },
                          ),
                          TextButton(
                            child: Text("Yes"),
                            onPressed: () {
                              logOut();

                              if (accessToken == "") {
                                clearUserData();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                    (route) => false);
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: getCustomizedButton(
                    Utils().getScreenSize().width * 0.85,
                    Utils().getScreenSize().height * 0.062,
                    const Text(
                      "Sign out",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    orangeColor,
                    Border()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

getSettingListTile(Text Mytitle, Widget widget, onTap) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      title: Mytitle,
      trailing: widget,
    ),
  );
}

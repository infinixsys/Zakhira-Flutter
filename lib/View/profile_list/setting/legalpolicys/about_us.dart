import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/Models/about_us_model.dart';
import 'package:zakira/Models/privacy_policy_model.dart';
import 'package:zakira/Services/config.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<AboutUsView> {
  // *** Api Call***

  AboutUsModel? aboutUsModel;

  bool isLoading = false;
  String apiUrl = Config.baseapiUrl + Config.aboutUsApi;

  Future<AboutUsModel?> fetchAboutUsData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          print(response.body);
          isLoading = false;
        });
        aboutUsModel = AboutUsModel.fromJson(data);
        return aboutUsModel;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        throw Exception("Failed to load data ");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAboutUsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              children: [
                Center(
                  child: Image.asset("assets/logo_zakhira.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    aboutUsModel!.results!.data.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              ],
            ),
    );
  }
}

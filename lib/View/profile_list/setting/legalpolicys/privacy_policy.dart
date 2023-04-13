import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/Models/privacy_policy_model.dart';
import 'package:zakira/Services/config.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  // *** Api Call***

  PrivacyPolicysModel? privacyPolicysModel;

  bool isLoading = false;
  String apiUrl = Config.baseapiUrl + Config.privacyPolicyApi;

  Future<PrivacyPolicysModel?> fetchPrivaPolicyData() async {
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
        privacyPolicysModel = PrivacyPolicysModel.fromJson(data);
        return privacyPolicysModel;
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
    fetchPrivaPolicyData();
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
                    privacyPolicysModel!.results!.data.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              ],
            ),
    );
  }
}

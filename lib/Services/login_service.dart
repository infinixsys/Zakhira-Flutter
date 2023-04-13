import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/View/home_Screen.dart';

class LoginService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var client = http.Client();
  String message = "";

  Future<void> loginWithPhone(
      String phonenumber, String password, BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(Config.baseapiUrl + Config.loginApi);
      Map body = {
        "number": phonenumber,
        "password": password,
      };

      print(body);

      var response =
          await client.post(url, body: jsonEncode(body), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        // print(response.statusCode);
        final json = jsonDecode(response.body);
        print(json);
        if (response.statusCode == 200) {
          var token = json['results']['accessToken'];
          SharedPreferences prefs =await SharedPreferences.getInstance();
          prefs.setString("accesstoken", token);
          // ignore: use_build_context_synchronously
          await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
          // print(token);
          // ignore: use_build_context_synchronously

          
          // ignore: use_build_context_synchronously
        } else {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          throw message =
              jsonDecode(response.body)['message'] ?? "Unknown error";
        }
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        throw message = jsonDecode(response.body)['message'] ?? "Unknown error";
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text("Something went wrong"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      "Unknown error";
    }
  }

//  ***
  // setTokenValue(accessValue, refreshValue, name,) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('accesstoken', accessValue);
  //   preferences.setString('refreshtoken', refreshValue);
  //   preferences.setString("name", name);
  // }
}

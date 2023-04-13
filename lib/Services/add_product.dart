import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/login_service.dart';
import 'package:zakira/View/home_Screen.dart';

class AddProductService {
   // -------Add Product----

  String accessToken = "";
  String refreshToken = "";
bool isApiCallProcess =false;
  Future<void> addProductWithApi(
      String productName,
      String imageUrl,
      String category,
      String subCategory,
      String productType,
      String moq,
      String stockStatus,
      String stockQty,
      String shortDescription,
      String longDescription,
      String price,
      List<String> tax,
      String isTaxIncluded,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    const String apiUrl = Config.baseapiUrl + Config.addProductApi;
    print(accessToken);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final Map<String, dynamic> body = {
      'productName': productName,
      'imageUrl': imageUrl,
      'category': category,
      "subCategory": subCategory,
      'productType': productType,
      'moq': moq,
      'stockStatus': stockStatus,
      'stockQty': stockQty,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
      'price': price,
      "isTaxIncluded": isTaxIncluded,
      'tax': tax
    };
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print('Product added successfully!');
      print(response.body);
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: isApiCallProcess
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text("Product upload Successfull"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 422) {
      print(response.body);
      print('Failed to add product.');
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content:
                const Text("Enter minimum 30 characters for Long description"),
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
    } else {
      print(response.statusCode);
      print('Failed to add product.');
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text("Failed to upload product"),
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
    }
  }
}

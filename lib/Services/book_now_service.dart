import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/payment_screen/order_succes.dart';

class BookNowService {
  String accessToken = '';

  Future<void> bookOrder(
      String productId,
      int quantity,
      String userId,
      String addrressId,
      String paymentmode,
      String message,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    final url = Uri.parse(Config.baseapiUrl + Config.bookNowApi);
    final body = jsonEncode({
      "addressId": addrressId,
      "message": message,
      "paymentMode": paymentmode,
      "items": [
        {"productId": productId, "quantity": quantity}
      ]
    });

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });

      if (response.statusCode == 200) {
        print(response.body);
        print("Order SuccessFull");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderSucessScreen(),
            ));
        // Order booking successful
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print("Error :$e");
    }
  }
}

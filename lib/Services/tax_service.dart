import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Models/tax_model.dart';
import 'package:zakira/Services/config.dart';

class TaxService {
  String accessToken = "";

  TaxModel? taxModel;
  Future<TaxModel?> fetchTaxData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    try {
      final response = await http
          .get(Uri.parse(Config.baseapiUrl + Config.getAllTax), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);

        taxModel = TaxModel.fromJson(data);
        return taxModel;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data: $error ");
    }
    return null;
  }
}

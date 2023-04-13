import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Models/all_product.dart';
import 'package:zakira/Models/home_product_model.dart';
import 'package:zakira/Services/config.dart';

class ProductService {
  String accessToken = '';
  AllProduct? allProduct;

  Future<AllProduct?> fetchAllProductData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    try {
      final response = await http.get(
          Uri.parse(
              "${Config.baseapiUrl}/api/v1/users/products?limit=15&page=1"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['results']);

        allProduct = AllProduct.fromJson(data);
        return allProduct;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data: $error ");
    }
    return null;
  }

  // ------HomeProduct-----
  HomeProduct? homeProduct;

  String apiUrl = Config.baseapiUrl + Config.homeproduct;

  Future<HomeProduct?> fetchHomeProductData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(response.body);

        homeProduct = HomeProduct.fromJson(data);
        return homeProduct;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data: $error ");
    }
    return homeProduct;
  }
}

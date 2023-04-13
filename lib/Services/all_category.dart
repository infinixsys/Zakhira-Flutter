import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Models/all_category_model.dart';
import 'package:zakira/Services/config.dart';

class AllCategoryService {
  // Future<List<AllCategoryModel>> fetchProductCategories() async {
  //   final response =
  //       await http.get(Uri.parse(Config.baseapiUrl + Config.allCategoryApi));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response, parse the JSON
  //     List<dynamic> jsonResponse = jsonDecode(response.body);
  //     print(jsonResponse);
  //     return jsonResponse
  //         .map((category) => AllCategoryModel.fromJson(category))
  //         .toList();
  //   } else {
  //     // If the server did not return a 200 OK response, throw an error.
  //     throw Exception('Failed to load product categories');
  //   }
  // }

  // ---------


}

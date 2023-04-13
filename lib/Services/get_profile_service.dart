import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zakira/Services/config.dart';

class ProfileApi {
  Map<String, dynamic> profileData = {};

  bool isLoading = false;
  String apiUrl = Config.baseapiUrl + Config.getProfile;

  Future<void> fetchProfileData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        profileData = jsonDecode(response.body);
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      throw Exception("Failed to load data ");
    }
  }
}

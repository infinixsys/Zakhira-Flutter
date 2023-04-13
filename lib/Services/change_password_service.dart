import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zakira/Services/config.dart';

class ChangePasswordService {
  Future<http.Response> changePassword(
      String phoneNumber, String newPassword) async {
    final url = Uri.parse(Config.baseapiUrl + Config.changePasswordApi);

    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"password": newPassword, "number": phoneNumber}),
    );

    print(response.body);

    return response;
  }
}

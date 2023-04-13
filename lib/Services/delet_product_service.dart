import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Services/config.dart';

class DeletProduct {
  String accessToken = '';
  Future<void> deleteProductById(String id) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    final response = await http
        .delete(Uri.parse('${Config.baseapiUrl + Config.deletProductApi}$id'),headers: {
           'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      print(response.body);
      print('Product deleted successfully!');
    } else {
      print(response.body);
    }
  }
}

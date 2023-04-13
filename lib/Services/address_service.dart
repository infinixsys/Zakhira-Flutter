import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Models/all_address_model.dart';
import 'package:zakira/Models/states_model.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/View/profile_list/add_address_screen.dart';
import 'package:zakira/payment_screen/check_out_screen.dart';

import '../Models/single_address_model.dart';

class AddressService {
// --------Upload
  String accessToken = '';
  bool isApiCallProcess = false;

  Future<void> uploadAddress(
      String firstName,
      String lastName,
      String address,
      String city,
      String state,
      String zipCode,
      String phoneNumber,
      alternatNumber,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    const String apiUrl = Config.baseapiUrl + Config.saveAddressApi;
    print(accessToken);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final Map<String, dynamic> body = {
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "city": city,
      "state": state,
      "zipCode": zipCode,
      "phoneNumber": phoneNumber,
      "alternateNumber": alternatNumber
    };
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print('Address added successfully!');
      print(body);
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
                : const Text("Address upload Successfull"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 422) {
      print(response.body);

      print('Failed to add Address.');
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text("Somthing went wrong"),
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
      print('Failed to add Address.');
      final data = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(data['errors']['msg']),
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

  // -------getAddress---

  AllAddress? allAddress;

  Future<AllAddress?> fetchAddressData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    try {
      final response = await http
          .get(Uri.parse(Config.baseapiUrl + Config.getAddressApi), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['results']);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("addressId", data['results'][0]["addressId"]);

        allAddress = AllAddress.fromJson(data);
        return allAddress;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data ");
    }
    return null;
  }

  // -------getStates----

  // StatesNameIdModel? statesNameIdModel;

  // String url = Config.baseapiUrl + Config.getStatatApi;

  // Future<StatesNameIdModel?> fetchStateData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   accessToken = prefs.remove('accesstoken') ?? '';
  //   try {
  //     final response = await http.get(Uri.parse(url), headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $accessToken',
  //     });
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       print(data);

  //       statesNameIdModel = StatesNameIdModel.fromJson(data);
  //       return statesNameIdModel;
  //     } else {
  //       throw Exception("Failed to load data ");
  //     }
  //   } catch (error) {
  //     print("Failed to load data ");
  //   }
  //   return null;
  // }

  // -------------Get Single Address

  SingleAddressModel? singleAddressModel;

  Future<SingleAddressModel?> fetchSingleAddressData(
      String addressId, BuildContext context, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    try {
      final response = await http.get(
          Uri.parse(Config.baseapiUrl + Config.getSingleAddressApi + addressId),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['results'].toString());

        SharedPreferences preferences = await SharedPreferences.getInstance();

        preferences.setString('firstName', data['results'][index]['firstName']);
        preferences.setString('lastName', data['results'][index]['lastName']);
        preferences.setString('state', data['results'][index]['state']);
        preferences.setInt('zipCode', data['results'][index]['zipCode']);
        preferences.setString('city', data['results'][index]['city']);
        preferences.setString('address', data['results'][index]['address']);
        preferences.setString('addressid', data['results'][index]['address']);

        preferences.setString(
            'phoneNumber', data['results'][index]['phoneNumber']);
        preferences.setString(
            'alternateNumber', data['results'][index]['alternateNumber']);

        singleAddressModel = SingleAddressModel.fromJson(data);
        return singleAddressModel;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data ");
      print(error);
    }
    return singleAddressModel;
  }

  // ----------Delet Address---

  Future<void> deleteAddressById(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    final response = await http.delete(
        Uri.parse('${Config.baseapiUrl + Config.getdeleteAddressApi}$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('firstName');
      pref.remove('lastName');
      pref.remove('state');
      pref.remove('city');
      pref.remove('address');
      pref.remove("zipCode");
      pref.remove('phoneNumber');
      pref.remove('alternateNumber');
      pref.remove('addressId');
      print(response.body);
      print('Address deleted successfully!');
    } else {
      print(response.body);
    }
  }

  // -------Update Adress----

  Future updateAddressData(
      String firstName,
      String lastName,
      String address,
      String city,
      String state,
      String zipCode,
      String phoneNumber,
      String alternatNumber,
      String addressId,
      int index,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';
    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "city": city,
      "state": state,
      "zipCode": zipCode,
      "phoneNumber": phoneNumber,
      "alternateNumber": alternatNumber,
      "is_default": false
    };

    final url = "${Config.baseapiUrl + Config.getUpdateAddressApi}$addressId";

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode(body),
    );

// Show success or fail message based on status
    if (response.statusCode == 200) {
      print(response.body);

      print("Address Updated");

      // var data = jsonDecode(response.body);
      // print(data['results'].toString());

      // SharedPreferences preferences = await SharedPreferences.getInstance();

      // preferences.setString('firstName', data['results'][index]['firstName']);
      // preferences.setString('lastName', data['results'][index]['lastName']);
      // preferences.setString('state', data['results'][index]['state']);
      // preferences.setInt('zipCode', data['results'][index]['zipCode']);
      // preferences.setString('city', data['results'][index]['city']);
      // preferences.setString('address', data['results'][index]['address']);

      // preferences.setString(
      //     'phoneNumber', data['results'][index]['phoneNumber']);
      // preferences.setString(
      //     'alternateNumber', data['results'][index]['alternateNumber']);
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text("Address Updated"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAddressScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print(response.body);
    }
  }
}

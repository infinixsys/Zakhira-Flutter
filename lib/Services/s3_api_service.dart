import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/Models/s3_model.dart';
import 'package:zakira/Services/config.dart';

import '../Models/s3_base_url_model.dart';

class S3Service {
  S3Model? s3model;
  String apiUrl = Config.baseapiUrl + Config.S3Api;

  // --- api CaLL
  Future<S3Model?> fetchS3Data() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        s3model = S3Model.fromJson(data);
        return s3model;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data ");
    }
    return null;
  }

  // --- api CaLL
  S3BaseUrlModel? s3baseUrlModel;
  String url = Config.baseapiUrl + Config.S3BaseApi;

  Future<S3BaseUrlModel?> fetchS3BaseUrlData() async {
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        s3baseUrlModel = S3BaseUrlModel.fromJson(data);
        return s3baseUrlModel;
      } else {
        throw Exception("Failed to load data ");
      }
    } catch (error) {
      print("Failed to load data ");
    }
    return null;
  }
}

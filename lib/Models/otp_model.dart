import 'dart:convert';

OtpModel otpResponseModelJSON(String str) => OtpModel.fromJson(jsonDecode(str));

class OtpModel {
  bool? error;
  String? message;
  int? code;
  Results? results;

  OtpModel({this.error, this.message, this.code, this.results});

  OtpModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    code = json['code'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  int? otp;
  String? number;

  Results({this.otp, this.number});

  Results.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['number'] = this.number;
    return data;
  }
}

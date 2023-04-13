class PrivacyPolicysModel {
  bool? error;
  String? message;
  int? code;
  Results? results;

  PrivacyPolicysModel({this.error, this.message, this.code, this.results});

  PrivacyPolicysModel.fromJson(Map<String, dynamic> json) {
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
  String? data;

  Results({this.data});

  Results.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}

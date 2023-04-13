class S3BaseUrlModel {
  String? message;
  bool? error;
  Results? results;

  S3BaseUrlModel({this.message, this.error, this.results});

  S3BaseUrlModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  String? url;

  Results({this.url});

  Results.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

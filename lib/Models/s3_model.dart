class S3Model {
  bool? error;
  String? message;
  int? code;
  Results? results;

  S3Model({this.error, this.message, this.code, this.results});

  S3Model.fromJson(Map<String, dynamic> json) {
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
  String? poold;
  String? bucketName;

  Results({this.poold, this.bucketName});

  Results.fromJson(Map<String, dynamic> json) {
    poold = json['poold'];
    bucketName = json['bucketName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poold'] = this.poold;
    data['bucketName'] = this.bucketName;
    return data;
  }
}

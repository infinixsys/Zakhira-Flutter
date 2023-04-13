class TaxModel {
  String? message;
  bool? error;
  List<Results>? results;

  TaxModel({this.message, this.error, this.results});

  TaxModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? taxName;
  int? taxPercentage;
  String? name;
  bool? status;
  bool? isDefault;
  String? id;

  Results(
      {this.taxName,
      this.taxPercentage,
      this.name,
      this.status,
      this.isDefault,
      this.id});

  Results.fromJson(Map<String, dynamic> json) {
    taxName = json['taxName'];
    taxPercentage = json['taxPercentage'];
    name = json['name'];
    status = json['status'];
    isDefault = json['is_default'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxName'] = this.taxName;
    data['taxPercentage'] = this.taxPercentage;
    data['name'] = this.name;
    data['status'] = this.status;
    data['is_default'] = this.isDefault;
    data['id'] = this.id;
    return data;
  }
}

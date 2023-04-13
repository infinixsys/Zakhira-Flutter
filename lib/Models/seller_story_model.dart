class SellerStoryModel {
  bool? error;
  String? message;
  int? code;
  List<Results>? results;

  SellerStoryModel({this.error, this.message, this.code, this.results});

  SellerStoryModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    code = json['code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? image;
  String? id;
  String? name;

  Results({this.image, this.id, this.name});

  Results.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

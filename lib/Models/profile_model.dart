class ProfileModel {
  bool? error;
  String? message;
  int? code;
  Results? results;

  ProfileModel({this.error, this.message, this.code, this.results});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastname;
  String? phone;
  String? email;
  String? image;

  Results({this.firstName, this.lastname, this.phone, this.email, this.image});

  Results.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastname = json['lastname'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}

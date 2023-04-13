class AllAddress {
  String? message;
  bool? error;
  List<Results>? results;

  AllAddress({this.message, this.error, this.results});

  AllAddress.fromJson(Map<String, dynamic> json) {
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
  bool? isDefault;
  String? state;
  String? city;
  String? firstName;
  String? lastName;
  String? address;
  int? zipCode;
  String? phoneNumber;
  String? alternateNumber;
  String? addressId;

  Results(
      {this.isDefault,
      this.state,
      this.city,
      this.firstName,
      this.lastName,
      this.address,
      this.zipCode,
      this.phoneNumber,
      this.alternateNumber,
      this.addressId});

  Results.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    state = json['state'];
    city = json['city'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    zipCode = json['zipCode'];
    phoneNumber = json['phoneNumber'];
    alternateNumber = json['alternateNumber'];
    addressId = json['addressId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_default'] = this.isDefault;
    data['state'] = this.state;
    data['city'] = this.city;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['zipCode'] = this.zipCode;
    data['phoneNumber'] = this.phoneNumber;
    data['alternateNumber'] = this.alternateNumber;
    data['addressId'] = this.addressId;
    return data;
  }
}

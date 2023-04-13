class AllProduct {
  String? message;
  bool? error;
  List<Results>? results;

  AllProduct({this.message, this.error, this.results});

  AllProduct.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  int? price;
  String? image;
  String? productType;
  int? moq;
  String? stockQuantity;
  int? stockCount;
  List<Tax>? tax;
  String? createdDate;
  String? productId;

  Results(
      {this.productName,
      this.price,
      this.image,
      this.productType,
      this.moq,
      this.stockQuantity,
      this.stockCount,
      this.tax,
      this.createdDate,
      this.productId});

  Results.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    price = json['price'];
    image = json['image'];
    productType = json['productType'];
    moq = json['moq'];
    stockQuantity = json['stockQuantity'];
    stockCount = json['stockCount'];
    if (json['tax'] != null) {
      tax = <Tax>[];
      json['tax'].forEach((v) {
        tax!.add(new Tax.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['image'] = this.image;
    data['productType'] = this.productType;
    data['moq'] = this.moq;
    data['stockQuantity'] = this.stockQuantity;
    data['stockCount'] = this.stockCount;
    if (this.tax != null) {
      data['tax'] = this.tax!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['productId'] = this.productId;
    return data;
  }
}

class Tax {
  String? sId;
  String? taxName;
  int? taxPercentage;
  String? name;
  bool? status;
  bool? isDefault;
  int? iV;

  Tax(
      {this.sId,
      this.taxName,
      this.taxPercentage,
      this.name,
      this.status,
      this.isDefault,
      this.iV});

  Tax.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    taxName = json['taxName'];
    taxPercentage = json['taxPercentage'];
    name = json['name'];
    status = json['status'];
    isDefault = json['is_default'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['taxName'] = this.taxName;
    data['taxPercentage'] = this.taxPercentage;
    data['name'] = this.name;
    data['status'] = this.status;
    data['is_default'] = this.isDefault;
    data['__v'] = this.iV;
    return data;
  }
}

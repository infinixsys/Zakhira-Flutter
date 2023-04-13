class HomeProduct {
  String? message;
  bool? error;
  List<Results>? results;

  HomeProduct({this.message, this.error, this.results});

  HomeProduct.fromJson(Map<String, dynamic> json) {
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
  int? offerPrice;
  String? image;
  String? subCategoryId;
  String? productType;
  int? moq;
  String? stockQuantity;
  int? stockCount;
  String? isTaxIncluded;
  List<Tax>? tax;
  String? createdDate;
  double? off;
  String? productId;

  Results(
      {this.productName,
      this.price,
      this.offerPrice,
      this.image,
      this.subCategoryId,
      this.productType,
      this.moq,
      this.stockQuantity,
      this.stockCount,
      this.isTaxIncluded,
      this.tax,
      this.createdDate,
      this.off,
      this.productId});

  Results.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    price = json['price'];
    offerPrice = json['offerPrice'];
    image = json['image'];
    subCategoryId = json['subCategoryId'];
    productType = json['productType'];
    moq = json['moq'];
    stockQuantity = json['stockQuantity'];
    stockCount = json['stockCount'];
    isTaxIncluded = json['isTaxIncluded'];
    if (json['tax'] != null) {
      tax = <Tax>[];
      json['tax'].forEach((v) {
        tax!.add(new Tax.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    off = json['off'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['offerPrice'] = this.offerPrice;
    data['image'] = this.image;
    data['subCategoryId'] = this.subCategoryId;
    data['productType'] = this.productType;
    data['moq'] = this.moq;
    data['stockQuantity'] = this.stockQuantity;
    data['stockCount'] = this.stockCount;
    data['isTaxIncluded'] = this.isTaxIncluded;
    if (this.tax != null) {
      data['tax'] = this.tax!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['off'] = this.off;
    data['productId'] = this.productId;
    return data;
  }
}

class Tax {
  String? taxName;
  int? taxPercentage;
  String? name;
  String? taxId;

  Tax({this.taxName, this.taxPercentage, this.name, this.taxId});

  Tax.fromJson(Map<String, dynamic> json) {
    taxName = json['taxName'];
    taxPercentage = json['taxPercentage'];
    name = json['name'];
    taxId = json['taxId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxName'] = this.taxName;
    data['taxPercentage'] = this.taxPercentage;
    data['name'] = this.name;
    data['taxId'] = this.taxId;
    return data;
  }
}

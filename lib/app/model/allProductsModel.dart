class AllProductsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  AllProductsModel({
    this.id,
    this.price,
    this.title,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  AllProductsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = _parsePrice(json["price"]);
    description = json["description"];
    category = json["category"];
    image = json["image"];
    rating = json["rating"] == null ? null : Rating.fromJson(json["rating"]);
  }

  static double? _parsePrice(dynamic price) {
    if (price is int) {
      return price.toDouble();
    } else if (price is double) {
      return price;
    } else if (price is String) {
      return double.tryParse(price);
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["description"] = description;
    _data["category"] = category;
    _data["image"] = image;
    if (rating != null) {
      _data["rating"] = rating?.toJson();
    }
    return _data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = _parseRate(json["rate"]);
    count = json["count"];
  }

  static double? _parseRate(dynamic rate) {
    if (rate is double) {
      return rate;
    } else if (rate is int) {
      return rate.toDouble();
    } else if (rate is String) {
      return double.tryParse(rate);
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate"] = rate;
    _data["count"] = count;
    return _data;
  }
}
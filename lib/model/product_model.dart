

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel{

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });

  int id;
  String title;
  String description;
  String category;
  String image;
  num  price;
  Rating rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    category: json["category"],
    image: json["image"],
    price: json["price"],
    rating: Rating.fromJson(json["rating"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "price": price,
    "rating": rating.toJson(),
  };

}

class Rating{
  num  rate;
  num  count;

  Rating({
    required this.rate,
    required this.count
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count
  };
}

import 'package:e_commerce/model/ratingmap.dart';

class ProductsResponse {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  late Rating rating;

  ProductsResponse(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

   ProductsResponse.fromJson(Map<String, dynamic> json) {
      id = json["id"];
      title = json["title"];
      price = double.parse(json["price"].toString());
      description = json["description"];
      category = json["category"];
      image = json["image"];
      rating = Rating.fromJson(json["rating"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating.toJson(),
    };
  }
}

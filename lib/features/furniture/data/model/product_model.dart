import 'dart:convert';

import 'package:pham/core/constants/constants.dart';
import 'package:pham/features/furniture/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.name,
      required super.price,
      required super.imageUrl,
      required super.description,
      required super.rating,
      required super.reviews,
      required super.quantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json["name"],
        price: json["current_price"][0]["USD"][0],
        imageUrl: "$kBaseApiUrl/images/${json["photos"][0]["url"]}",
        description: jsonDecode(json["description"])["description"],
        rating: jsonDecode(json["description"])["ratings"],
        reviews: jsonDecode(json["description"])["review"],
        quantity: json["available_quantity"]);
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
        name: entity.name,
        price: entity.price,
        imageUrl: entity.imageUrl,
        description: entity.description,
        rating: entity.rating,
        reviews: entity.reviews,
        quantity: entity.quantity);
  }
}

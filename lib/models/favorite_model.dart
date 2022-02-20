import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';

class FavoriteModel {
  FavoriteModel({
    this.id = 0,
    required this.product,
    this.userId = 0,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final ProductModel product;
  final int userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FavoriteModel.fromJson(String str) =>
      FavoriteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        product: ProductModel.fromMap(json["product"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "product_id": product.id,
      };
}

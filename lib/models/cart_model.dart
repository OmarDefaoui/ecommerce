import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';

class CartModel {
  CartModel({
    required this.id,
    required this.quantity,
    required this.product,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  int quantity;
  final ProductModel product;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CartModel.fromJson(String str) => CartModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        quantity: json["quantity"],
        product: ProductModel.fromMap(json["product"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "quantity": quantity,
        "product": product.toMap(),
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

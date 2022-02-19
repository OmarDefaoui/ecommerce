import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';

class CartModel {
  CartModel({
    this.id = 0,
    required this.quantity,
    required this.product,
    this.userId = 0,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  int quantity;
  final ProductModel product;
  final int userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
        "quantity": quantity,
        "product_id": product.id,
      };
}

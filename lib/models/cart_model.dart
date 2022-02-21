import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';

class CartModel {
  CartModel({
    this.id = 0,
    required this.quantity,
    required this.selectedColor,
    required this.product,
    this.userId = 0,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  int quantity;
  int selectedColor;
  final ProductModel product;
  final int userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CartModel.fromJson(String str) => CartModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        quantity: json["quantity"],
        selectedColor: json["selectedColor"],
        product: ProductModel.fromMap(json["product"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "selectedColor": selectedColor,
        "product_id": product.id,
      };
}

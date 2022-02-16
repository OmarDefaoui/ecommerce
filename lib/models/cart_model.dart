import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int numOfItem;

  CartModel({required this.product, required this.numOfItem});

  factory CartModel.fromJson(String str) => CartModel.fromMap(json.decode(str));

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        product: ProductModel.fromMap(json["product"]),
        numOfItem: json["numOfItem"],
      );
}

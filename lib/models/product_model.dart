import 'dart:convert';

import 'package:ecommerce/models/category_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.images,
    required this.rating,
    required this.discount,
    this.isFavourite = false,
    this.productCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final List<int> colors;
  final List<String> images;
  final double rating;
  final int discount;
  final bool isFavourite;
  CategoryModel? productCategory;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        price: json["price"].toDouble(),
        colors: json["colors"]
            .toString()
            .split(',')
            .map((c) => int.parse(c))
            .toList(),
        images: List<String>.from(json["images"].map((x) => x['image'])),
        rating: json["review"].toDouble(),
        discount: json["discount"],
        isFavourite: json["isFavourite"] ?? false,
        productCategory: json["product_category"] == null
            ? null
            : CategoryModel.fromMap(json["product_category"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "price": price,
        "colors": colors.join(','),
        "review": rating,
        "discount": discount,
        "isFavourite": isFavourite,
        "product_category":
            productCategory == null ? {} : productCategory!.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

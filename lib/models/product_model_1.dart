import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.review,
    required this.discount,
    required this.productCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String colors;
  final double review;
  final int discount;
  final Category productCategory;
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
        colors: json["colors"],
        review: json["review"].toDouble(),
        discount: json["discount"],
        productCategory: Category.fromMap(json["product_category"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "price": price,
        "colors": colors,
        "review": review,
        "discount": discount,
        "product_category": productCategory.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.globalCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final GlobalCategory globalCategory;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        globalCategory: GlobalCategory.fromMap(json["global_category"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "global_category": globalCategory.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class GlobalCategory {
  GlobalCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory GlobalCategory.fromJson(String str) =>
      GlobalCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlobalCategory.fromMap(Map<String, dynamic> json) => GlobalCategory(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

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
    this.productCategory,
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
        colors: json["colors"],
        review: json["review"].toDouble(),
        discount: json["discount"],
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
        "colors": colors,
        "review": review,
        "discount": discount,
        "product_category":
            productCategory == null ? {} : productCategory!.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class CategoryModel {
  CategoryModel({
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

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
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

class GlobalCategoryModel {
  GlobalCategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final List<CategoryModel> categories;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory GlobalCategoryModel.fromJson(String str) =>
      GlobalCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlobalCategoryModel.fromMap(Map<String, dynamic> json) =>
      GlobalCategoryModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromMap(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "categories":
            List<CategoryModel>.from(categories.map((x) => x.toMap())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

import 'dart:convert';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        image: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class GlobalCategoryModel {
  GlobalCategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String image;
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
        image: json["description"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromMap(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": image,
        "categories":
            List<CategoryModel>.from(categories.map((x) => x.toMap())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

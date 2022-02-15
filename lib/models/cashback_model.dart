import 'dart:convert';

class CashbackModel {
  CashbackModel({
    required this.id,
    required this.title,
    required this.body,
    required this.pourcentage,
    required this.expirationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String body;
  final int pourcentage;
  final DateTime expirationDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CashbackModel.fromJson(String str) =>
      CashbackModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CashbackModel.fromMap(Map<String, dynamic> json) => CashbackModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        pourcentage: json["pourcentage"],
        expirationDate: DateTime.parse(json["expiration_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
        "pourcentage": pourcentage,
        "expiration_date":
            "${expirationDate.year.toString().padLeft(4, '0')}-${expirationDate.month.toString().padLeft(2, '0')}-${expirationDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

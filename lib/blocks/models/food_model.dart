// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  FoodModel({
    required this.description,
    required this.imageUrl,
    required this.modificationDate,
    required this.orderId,
    required this.title,
  });

  String description;
  String imageUrl;
  DateTime modificationDate;
  int orderId;
  String title;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    description: json["description"],
    imageUrl: json["image_url"],
    modificationDate: DateTime.parse(json["modificationDate"]),
    orderId: json["orderId"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "image_url": imageUrl,
    "modificationDate": "${modificationDate.year.toString().padLeft(4, '0')}-${modificationDate.month.toString().padLeft(2, '0')}-${modificationDate.day.toString().padLeft(2, '0')}",
    "orderId": orderId,
    "title": title,
  };
}
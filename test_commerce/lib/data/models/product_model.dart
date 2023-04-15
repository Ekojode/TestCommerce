// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.category,
    this.subCategory,
    this.image,
    this.v,
  });

  String? id;
  String? name;
  int? price;
  String? description;
  String? category;
  String? subCategory;
  String? image;
  int? v;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<ProductModel> getProductList(List<dynamic> val) {
    return val.map((e) => ProductModel.fromJson(e)).toList();
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        subCategory: json["subCategory"],
        image: json["image"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "subCategory": subCategory,
        "image": image,
        "__v": v,
      };
}

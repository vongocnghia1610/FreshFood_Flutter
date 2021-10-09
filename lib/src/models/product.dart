import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_postman_application/src/models/group_product.dart';
import 'package:flutter_postman_application/src/public/constant.dart';

class Product {
  final String id;
  List<String> image;
  int status;
  double weight;
  double price;
  int quantity;
  String name;
  String detail;
  GroupProduct groupProduct;

  Product({
    this.id,
    this.image,
    this.status,
    this.weight,
    this.price,
    this.quantity,
    this.name,
    this.detail,
    this.groupProduct,
  });

  Product copyWith({
    String id,
    List<String> image,
    int status,
    double weight,
    double price,
    int quantity,
    String name,
    String detail,
    List<dynamic> groupProduct,
  }) {
    return Product(
      id: id ?? this.id,
      image: image ?? this.image,
      status: status ?? this.status,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      groupProduct: groupProduct ?? this.groupProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'status': status,
      'weight': weight,
      'price': price,
      'quantity': quantity,
      'name': name,
      'detail': detail,
      'groupProduct': groupProduct,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      image: listDefaultImage,
      status: map['status'],
      weight: double.tryParse((map['weight'] ?? 0).toString()),
      price: double.tryParse((map['weight'] ?? 0).toString()),
      quantity: map['quantity'],
      name: map['name'],
      detail: map['detail'],
      groupProduct: GroupProduct.fromMap(map['groupProduct']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, image: $image, status: $status, weight: $weight, price: $price, quantity: $quantity, name: $name, detail: $detail, groupProduct: $groupProduct)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        listEquals(other.image, image) &&
        other.status == status &&
        other.weight == weight &&
        other.price == price &&
        other.quantity == quantity &&
        other.name == name &&
        other.detail == detail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        status.hashCode ^
        weight.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        name.hashCode ^
        detail.hashCode ^
        groupProduct.hashCode;
  }
}

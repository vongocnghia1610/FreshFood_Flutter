import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_postman_application/src/models/history.dart';
import 'package:flutter_postman_application/src/models/product.dart';

class OrderModel {
  final String id;
  List<ProductModel> product;
  List<HistoryModel> history;
  int status;
  String orderCode;
  double totalMoney;
  double shipFee;
  String typePayment;
  String address;
  String customerId;
  DateTime createdAt;
  DateTime updatedAt;

  OrderModel({
    this.id,
    this.product,
    this.history,
    this.status,
    this.orderCode,
    this.totalMoney,
    this.shipFee,
    this.typePayment,
    this.address,
    this.customerId,
    this.createdAt,
    this.updatedAt,
  });

  OrderModel copyWith({
    String id,
    List<ProductModel> product,
    List<HistoryModel> history,
    int status,
    String orderCode,
    double totalMoney,
    double shipFee,
    String typePayment,
    String address,
    String customerId,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      product: product ?? this.product,
      history: history ?? this.history,
      status: status ?? this.status,
      orderCode: orderCode ?? this.orderCode,
      totalMoney: totalMoney ?? this.totalMoney,
      shipFee: shipFee ?? this.shipFee,
      typePayment: typePayment ?? this.typePayment,
      address: address ?? this.address,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product?.map((x) => x.toMap())?.toList(),
      'history': history?.map((x) => x.toMap())?.toList(),
      'status': status,
      'orderCode': orderCode,
      'totalMoney': totalMoney,
      'shipFee': shipFee,
      'typePayment': typePayment,
      'address': address,
      'customerId': customerId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      product: List<ProductModel>.from(
          map['product']?.map((x) => ProductModel.fromMap(x))),
      history: List<HistoryModel>.from(
          map['history']?.map((x) => HistoryModel.fromMap(x))),
      status: map['status'],
      orderCode: map['orderCode'],
      totalMoney: map['totalMoney'],
      shipFee: map['shipFee'],
      typePayment: map['typePayment'],
      address: map['address'],
      customerId: map['customerId'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, product: $product, history: $history, status: $status, orderCode: $orderCode, totalMoney: $totalMoney, shipFee: $shipFee, typePayment: $typePayment, address: $address, customerId: $customerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.id == id &&
        listEquals(other.product, product) &&
        listEquals(other.history, history) &&
        other.status == status &&
        other.orderCode == orderCode &&
        other.totalMoney == totalMoney &&
        other.shipFee == shipFee &&
        other.typePayment == typePayment &&
        other.address == address &&
        other.customerId == customerId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        product.hashCode ^
        history.hashCode ^
        status.hashCode ^
        orderCode.hashCode ^
        totalMoney.hashCode ^
        shipFee.hashCode ^
        typePayment.hashCode ^
        address.hashCode ^
        customerId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}

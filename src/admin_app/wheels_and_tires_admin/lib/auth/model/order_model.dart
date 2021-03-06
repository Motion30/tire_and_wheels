import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel {
  const OrderModel({
    @required this.userData,
    @required this.address,
    @required this.products,
    @required this.status,
    @required this.timestamp,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userData: map['userData'] as Map<String, dynamic>,
      address: map['address'] as Map<String, dynamic>,
      products: map['products'] as List<dynamic>,
      status: map['status'] as String,
      timestamp: map['timestampe'] as Timestamp ?? Timestamp.now(),
    );
  }

  final Map<String, dynamic> userData;
  final Map<String, dynamic> address;
  final List<dynamic> products;
  final String status;
  final Timestamp timestamp;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userData': userData,
      'address': address,
      'products': products,
      'status': status,
      'timestampe': timestamp,
    };
  }
}

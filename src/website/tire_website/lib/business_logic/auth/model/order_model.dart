import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';

class OrderModel {
  const OrderModel({
    @required this.userData,
    @required this.address,
    @required this.products,
    @required this.status,
    @required this.paymentType,
    this.timestamp,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userData: map['userData'] as Map<String, dynamic>,
      address: map['address'] as Map<String, dynamic>,
      products: map['products'] as List<Map<String, dynamic>>,
      status: map['status'] as String,
      paymentType: map['payment_type'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  final Map<String, dynamic> userData;
  final Map<String, dynamic> address;
  final List<Map<String, dynamic>> products;
  final String status;
  final String paymentType;
  final Timestamp timestamp;

  Map<String, dynamic> toMap() {
    final String userUid = AuthenticationRepo().getUserUid();

    return <String, dynamic>{
      'userData': userData,
      'address': address,
      'products': products,
      'status': status,
      'userId': userUid,
      'payment_type': paymentType,
      'timestamp': Timestamp.now(),
    };
  }
}

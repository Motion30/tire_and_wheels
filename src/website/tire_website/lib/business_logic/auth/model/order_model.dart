import 'package:flutter/material.dart';

class OrderModel {

  const OrderModel({
    @required this.userData,
    @required this.address,
    @required this.products,
    @required this.status,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userData: map['userData'] as Map<String, dynamic>,
      address: map['address'] as Map<String, dynamic>,
      products: map['products'] as List<Map<String, dynamic>>,
      status: map['status'] as String,
    );
  }

  final Map<String, dynamic> userData;
  final Map<String, dynamic> address;
  final List<Map<String, dynamic>> products;
  final String status;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userData': userData,
      'address': address,
      'products': products,
      'status': status,
    } ;
  }
}

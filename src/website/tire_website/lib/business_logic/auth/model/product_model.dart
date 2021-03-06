import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  const ProductModel({
    @required this.productId,
    @required this.productName,
    @required this.productBrand,
    @required this.productInfo,
    @required this.type,
    @required this.images,
    @required this.size,
    @required this.price,
    @required this.timestamp,
    this.cartCount,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] as String ?? 'id',
      productName: map['productName'] as String ?? 'product Name',
      productBrand: map['productBrand'] as String ?? 'product brand',
      type: map['type'] as String ?? 'type',
      productInfo: map['productInfo'] as String ?? 'product info',
      images: List<String>.from(map['images'] as List<dynamic> ??
          <String>[
            'https://media.istockphoto.com/photos/new-tyre-isolated-on-white-background-picture-id860093394?k=6&m=860093394&s=612x612&w=0&h=TN7s_wAu59D_H24T3a0Zuqww6pr444qdtH_eyyV1ebs='
          ]),
      size: map['size'] as int ?? 40,
      price: map['price'] as int ?? 1000,
      cartCount: map['cartCount'] as int ?? 0,
      timestamp: map['timestamp'] as Timestamp ?? Timestamp.now(),
    );
  }

  final String productId;
  final String productName;
  final String productBrand;
  final String type;
  final String productInfo;
  final List<String> images;
  final int size;
  final int price;
  final int cartCount;
  final Timestamp timestamp;

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'type': type,
      'productBrand': productBrand,
      'productInfo': productInfo,
      'images': images,
      'size': size,
      'cartCount': cartCount,
      'price': price,
      'timestamp': timestamp.toDate(),
    } as Map<String, dynamic>;
  }
}

class CartModel {
  const CartModel({
    @required this.productId,
    @required this.id,
    @required this.productName,
    @required this.productBrand,
    @required this.productInfo,
    @required this.type,
    @required this.images,
    @required this.size,
    @required this.price,
    @required this.timestamp,
    this.cartCount,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productId: map['productId'] as String ?? 'id',
      id: map['id'] as String ?? 'id',
      productName: map['productName'] as String ?? 'product Name',
      productBrand: map['productBrand'] as String ?? 'product brand',
      type: map['type'] as String ?? 'type',
      productInfo: map['productInfo'] as String ?? 'product info',
      images: List<String>.from(map['images'] as List<dynamic> ??
          <String>[
            'https://media.istockphoto.com/photos/new-tyre-isolated-on-white-background-picture-id860093394?k=6&m=860093394&s=612x612&w=0&h=TN7s_wAu59D_H24T3a0Zuqww6pr444qdtH_eyyV1ebs='
          ]),
      size: map['size'] as int ?? 40,
      price: map['price'] as int ?? 1000,
      cartCount: map['cartCount'] as int ?? 0,
      timestamp: map['timestamp'] as Timestamp ?? Timestamp.now(),
    );
  }

  final String id;
  final String productId;
  final String productName;
  final String productBrand;
  final String type;
  final String productInfo;
  final List<String> images;
  final int size;
  final int price;
  final int cartCount;
  final Timestamp timestamp;

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'productName': productName,
      'type': type,
      'productBrand': productBrand,
      'productInfo': productInfo,
      'images': images,
      'size': size,
      'cartCount': cartCount,
      'price': price,
      'timestamp': timestamp.toDate(),
    } as Map<String, dynamic>;
  }
}

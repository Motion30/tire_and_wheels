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
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] as String ?? 'id',
      productName: map['productName'] as String ?? 'product Name',
      productBrand: map['productBrand'] as String ?? 'product brand',
      type: map['type'] as String ?? 'type',
      productInfo: map['productInfo'] as String ?? 'product info',
      images: map['images'] as List ??
          <String>[
            'https://media.istockphoto.com/photos/new-tyre-isolated-on-white-background-picture-id860093394?k=6&m=860093394&s=612x612&w=0&h=TN7s_wAu59D_H24T3a0Zuqww6pr444qdtH_eyyV1ebs='
          ],
      size: map['size'] as int ?? 40,
      price: map['price'] as int ?? 1000,
      timestamp: map['timestamp'] as Timestamp ?? Timestamp.now(),
    );
  }

  final String productId;
  final String productName;
  final String productBrand;
  final String type;
  final String productInfo;
  final List<dynamic> images;
  final int size;
  final int price;
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
      'price': price,
      'timestamp': timestamp.toDate(),
    } as Map<String, dynamic>;
  }

  ProductModel copyWith({
    String productId,
    String productName,
    String productBrand,
    String type,
    String productInfo,
    List<String> images,
    int size,
    int price,
    Timestamp timestamp,
  }) {
    if ((productId == null || identical(productId, this.productId)) &&
        (productName == null || identical(productName, this.productName)) &&
        (productBrand == null || identical(productBrand, this.productBrand)) &&
        (type == null || identical(type, this.type)) &&
        (productInfo == null || identical(productInfo, this.productInfo)) &&
        (images == null || identical(images, this.images)) &&
        (size == null || identical(size, this.size)) &&
        (price == null || identical(price, this.price)) &&
        (timestamp == null || identical(timestamp, this.timestamp))) {
      return this;
    }

    return new ProductModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productBrand: productBrand ?? this.productBrand,
      type: type ?? this.type,
      productInfo: productInfo ?? this.productInfo,
      images: images ?? this.images,
      size: size ?? this.size,
      price: price ?? this.price,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

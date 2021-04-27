import 'package:flutter/material.dart';

class AddressModel {
  const AddressModel({
    @required this.address,
    @required this.state,
    @required this.city,
    @required this.postalCode,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      address: map['address'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      postalCode: map['postalCode'] as int,
    );
  }

  final String address, state, city;
  final int postalCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'state': state,
      'city': city,
      'postalCode': postalCode,
    };
  }
}

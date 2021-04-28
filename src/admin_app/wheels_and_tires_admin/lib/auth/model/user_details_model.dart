import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDetails {
  UserDetails({
    @required this.uid,
    @required this.email,
    @required this.fullName,
    @required this.userName,
    @required this.phoneNumber,
    @required this.profilePicUrl,
    @required this.backgroundPic,
    this.timestamp,
  });

  String uid;
  String email;
  String fullName;
  String userName;
  int phoneNumber;
  String profilePicUrl;
  String backgroundPic;
  Timestamp timestamp;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'profilePicUrl': profilePicUrl,
      'timestamp': timestamp,
    };
  }

  // ignore: sort_constructors_first
  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      uid: map['uid'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      userName: map['userName'] as String,
      phoneNumber: map['phoneNumber'] as int,
      profilePicUrl: map['profilePicUrl'] as String,
      backgroundPic: map['backgroundPic'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  UserDetails copyWith({
    String uid,
    String email,
    String fullName,
    String userName,
    int phoneNumber,
    String profilePicUrl,
    Timestamp timestamp,
  }) {
    return UserDetails(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      backgroundPic: backgroundPic ?? backgroundPic,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

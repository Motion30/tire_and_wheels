import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatModel {
  const ChatModel({
    @required this.message,
    @required this.id,
    @required this.chatsDocId,
    @required this.senderId,
    @required this.type,
    @required this.receiverId,
    @required this.timestamp,
    this.fullName,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as String,
      message: map['message'] as String,
      chatsDocId: map['chatsDocId'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      type: map['type'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  factory ChatModel.fromInfoMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as String,
      message: map['lastMessage'] as String,
      chatsDocId: map['chatsDocId'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      type: map['type'] as String,
      timestamp: map['timestamp'] as Timestamp,
      fullName: map['fullName'] as String,
    );
  }

  final String message;
  final String chatsDocId;
  final String senderId;
  final String receiverId;
  final String type;
  final String id;
  final String fullName;
  final Timestamp timestamp;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'senderId': senderId,
      'chatsDocId': chatsDocId,
      'receiverId': receiverId,
      'type': type,
      'fullName': fullName,
      'timestamp': timestamp,
    };
  }

  Map<String, dynamic> toInfoMap() {
    return <String, dynamic>{
      'id': id,
      'lastMessage': message,
      'chatsDocId': chatsDocId,
      'senderId': senderId,
      'receiverId': receiverId,
      'type': type,
      'timestamp': timestamp,
    };
  }
}

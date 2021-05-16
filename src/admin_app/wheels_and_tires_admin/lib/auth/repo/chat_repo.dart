import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wheels_and_tires_admin/auth/model/chat_model.dart';
import 'package:wheels_and_tires_admin/auth/repo/authentication_repo.dart';
import 'package:wheels_and_tires_admin/utils/uuid.dart';

class ChatRepo {
  ChatRepo() {
    // firebaseFirestore.enablePersistence();
  }

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static final CollectionReference chatRef =
      firebaseFirestore.collection('chats');

  Future<void> sendMessage(String message, String id) async {
    // firebaseFirestore.enablePersistence();
    // final String userId = AuthenticationRepo().getUserUid();
    final String _id = Uuid.createCryptoRandomString(8);

    final ChatModel chatModel = ChatModel(
      message: message,
      id: _id,
      senderId: 'admin_123456',
      receiverId: id,
      type: 'text',
      timestamp: Timestamp.now(),
      chatsDocId: id,
    );

    await chatRef.doc(id).collection('messages').add(chatModel.toMap());
  }

  Stream getChats() async* {
    final String userId = AuthenticationRepo().getUserUid();
    yield chatRef.doc(userId).snapshots();
  }
}

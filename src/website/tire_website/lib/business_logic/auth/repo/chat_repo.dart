import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tire_website/business_logic/auth/model/chat_model.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';
import 'package:tire_website/utils/uuid.dart';

class ChatRepo {
  ChatRepo() {
    // firebaseFirestore.enablePersistence();
  }

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static final CollectionReference chatRef =
      firebaseFirestore.collection('chats');

  Future<void> sendMessage(String message) async {
    // firebaseFirestore.enablePersistence();
    final String userId = AuthenticationRepo().getUserUid();
    final String id = Uuid().createCryptoRandomString(8);

    final ChatModel chatModel = ChatModel(
      message: message,
      id: id,
      senderId: userId,
      receiverId: 'admin_123456',
      type: 'text',
      timestamp: Timestamp.now(),
    );

    // batch.set(
    //   chatRef.doc(userId),
    //   chatModel.toInfoMap(),
    //   SetOptions(merge: true),
    // );

    // batch.set(
    //   chatRef.doc(userId).collection('messages').doc(),
    //   chatModel.toMap(),
    // );

    // await batch.commit();

    await chatRef.doc(userId).collection('messages').add(chatModel.toMap());
  }

  Stream getChats() async* {
    final String userId = AuthenticationRepo().getUserUid();
    yield chatRef.doc(userId).snapshots();
  }
}

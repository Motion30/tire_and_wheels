import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:wheels_and_tires_admin/auth/model/chat_model.dart';
import 'package:wheels_and_tires_admin/auth/repo/authentication_repo.dart';
import 'package:wheels_and_tires_admin/auth/repo/chat_repo.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_text.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_textfield.dart';

class SelectedChatPage extends StatelessWidget {
  const SelectedChatPage(this.documentId, this.fullName);

  final String documentId;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          size: 16,
          fontWeight: FontWeight.w600,
          text: fullName,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ChatBody(documentId)),
          ChatTextField(documentId),
        ],
      ),
    );
  }
}

class ChatTextField extends StatefulWidget {
  const ChatTextField(this.id);

  final String id;

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController controller = TextEditingController();

  Future<void> sendMessage() async {
    if (controller.text.isNotEmpty) {
      final String message = controller.text.trim();
      controller.clear();

      await ChatRepo().sendMessage(message, widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomTextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              title: 'Type your message',
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          InkWell(
            onTap: () => sendMessage(),
            child: Container(
              width: 50.0,
              height: 45.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Center(
                child: Transform.rotate(
                  angle: -0 * pi / 180,
                  child: const Icon(
                    Icons.send_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: PaginateFirestore(
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (int index, BuildContext context,
            DocumentSnapshot documentSnapshot) {
          final ChatModel message = ChatModel.fromMap(documentSnapshot.data());
          return MessageBubble(message);
        },
        query: FirebaseFirestore.instance
            .collection('chats')
            .doc(id)
            .collection('messages')
            .orderBy('timestamp', descending: true),
        isLive: true,
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message);

  final ChatModel message;

  @override
  Widget build(BuildContext context) {
    final String userId = 'admin_123456';

    return Container(
      width: double.infinity,
      color: Colors.white,
      alignment: message.senderId == userId
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: message.senderId == userId
              ? Theme.of(context).primaryColor.withOpacity(0.7)
              : Theme.of(context).accentColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: message.senderId == userId
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: <Widget>[
            CustomText(
              text: message.message,
              color: Colors.white,
              size: 14,
            ),
            const SizedBox(height: 5.0),
            CustomText(
              text: message.timestamp
                  .toDate()
                  .toString()
                  .split(' ')[1]
                  .substring(0, 5),
              color: Colors.white,
              size: 12.0,
              fontWeight: FontWeight.w200,
            ),
          ],
        ),
      ),
    );
  }
}

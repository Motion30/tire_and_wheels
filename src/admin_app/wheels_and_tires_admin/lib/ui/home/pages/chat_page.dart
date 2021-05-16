import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:wheels_and_tires_admin/auth/model/chat_model.dart';
import 'package:wheels_and_tires_admin/ui/home/pages/selected_chat_page.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_text.dart';

class ChatPage extends StatelessWidget {
  const ChatPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PaginateFirestore(
        separator: const Divider(),
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot) {
          print(documentSnapshot.id);
          print(documentSnapshot.data());
          final ChatModel chat = ChatModel.fromInfoMap(documentSnapshot.data());
          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectedChatPage(
                  documentSnapshot.id,
                  chat.fullName ?? 'Name Not found',
                ),
              ),
            ),
            leading: CircleAvatar(
              child: Icon(Icons.person, color: Colors.grey[600]),
              backgroundColor: Colors.grey[300],
            ),
            title: CustomText(
              text: chat.fullName ?? 'Name Not found',
              size: 14,
              fontWeight: FontWeight.w600,
            ),
            subtitle: CustomText(
              text: chat.message,
              color: Colors.grey[700],
            ),
          );
        },
        emptyDisplay: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.chat_bubble_outline, size: 80),
              CustomText(
                text: 'Opps, No Chat found!',
                fontWeight: FontWeight.w300,
                size: 25.0,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        query:
            FirebaseFirestore.instance.collection('chats').orderBy('timestamp'),
        isLive: true,
      ),
    );
  }
}

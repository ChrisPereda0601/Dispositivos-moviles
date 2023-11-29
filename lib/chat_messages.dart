import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

CircleAvatar? buildSenderAvatar(
    String senderId, String currentUser, String initial) {
  if (currentUser == senderId) {
    return CircleAvatar(
      child: Text("$initial"),
    );
  } else {
    return null;
  }
}

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  Widget buildMessageContent(Map<String, dynamic> content) {
    List<Widget> widgets = [];
    Set<String> uniqueMessages = Set<String>();

    content.forEach((key, value) {
      if (value is String) {
        List<String> urls = value.split(',');

        // Show the message only once
        if (uniqueMessages.add(key)) {
          widgets.add(Text(key));
        }

        // Show the file icons for each URL in a horizontal row
        Row row = Row(
          children: urls
              .where((url) => Uri.parse(url.trim()).isAbsolute)
              .map((url) => Row(
                    children: [
                      Icon(Icons.file_present),
                    ],
                  ))
              .toList(),
        );

        widgets.add(row);
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats Chris"),
      ),
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: FirebaseFirestore.instance
            .collection("chats")
            .doc('rF0usnlBtQUyAPplpT3H')
            .collection('messages'),
        itemBuilder: (BuildContext context,
            QueryDocumentSnapshot<Map<String, dynamic>> document) {
          String currentUser = '456';

          String senderName = document.data()['senderName'];
          String initial = senderName[0];

          CircleAvatar? senderAvatar = buildSenderAvatar(
              document.data()['senderId'], currentUser, initial);

          return ListTile(
            title: buildMessageContent(document.data()['content']),
            subtitle: Text(
                'Nombre de quien lo envía: ${document.data()['senderName']}'),
            leading: senderAvatar,
            trailing: senderAvatar == null
                ? CircleAvatar(
                    child: Text("$initial"),
                  )
                : null,
          );
        },
      ),
    );
  }
}

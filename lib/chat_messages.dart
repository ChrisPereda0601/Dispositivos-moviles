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
          Map<String, dynamic> contentMap = document.data()['content'];
          List<String> contentKeys = contentMap.keys.toList();

          String currentUser = '456';

          String senderName = document.data()['senderName'];
          String initial = senderName[0];

          String key = contentKeys.isNotEmpty ? contentKeys[0] : '';

          CircleAvatar? senderAvatar = buildSenderAvatar(
              document.data()['senderId'], currentUser, initial);

          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mensaje: $key'),
              ],
            ),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  Future<int> getMessagesCount(String chatId) async {
    try {
      CollectionReference messagesCollection = FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages');

      QuerySnapshot querySnapshot = await messagesCollection.get();

      return querySnapshot.size;
    } catch (e) {
      print("Error al obtener el número de mensajes: $e");
      return 0;
    }
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
        query: FirebaseFirestore.instance.collection("chats"),
        itemBuilder: (BuildContext context,
            QueryDocumentSnapshot<Map<String, dynamic>> document) {
          Timestamp timestamp = document.data()['lastModifiedAt'];
          DateTime dateTime = timestamp.toDate();
          String formattedDate = DateFormat.yMd().add_Hm().format(dateTime);

          return FutureBuilder<int>(
            future: getMessagesCount(document.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                int messagesCount = snapshot.data ?? 0;
                return ListTile(
                  title: Text('Chat ${document.id}'),
                  subtitle: Text(
                      'Última modificación: $formattedDate | \nNúmero de mensajes: $messagesCount'),
                );
              }
            },
          );
        },
      ),
    );
  }
}

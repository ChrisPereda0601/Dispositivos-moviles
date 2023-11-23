import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> NewChat() async {
  CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  Map<String, dynamic> nuevoChat = {
    'chatters': ['Roberto2', 'Juan2'],
    'createdAt': FieldValue.serverTimestamp(),
    'lastModifiedAt': FieldValue.serverTimestamp(),
  };

  DocumentReference nuevoChatRef = await chatsCollection.add(nuevoChat);

  //Mi colección messages
  CollectionReference messagesCollection = nuevoChatRef.collection('messages');

  await messagesCollection.add({
    'content': {'hola2': 'images/prote.png'},
    'createdAt': FieldValue.serverTimestamp(),
    'senderId': '456',
    'senderName': 'Roberto'
  });
}

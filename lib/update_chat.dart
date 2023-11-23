import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> UpdateChat() async {
  try {
    CollectionReference chatMessagesCollection = FirebaseFirestore.instance
        .collection('chats')
        .doc('rF0usnlBtQUyAPplpT3H')
        .collection('messages');

    Map<String, dynamic> content = {
      'Otro mensaje de prueba': 'images/prote.png'
    };
    Timestamp timestamp = Timestamp.now();

    await chatMessagesCollection.add({
      'content': content,
      'createdAt': timestamp,
      'senderId': '456',
      'senderName': 'Roberto',
    });
  } catch (e) {
    print('Error al agregar el mensaje: $e');
  }
}

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> UpdateChat() async {
  try {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      final storage = FirebaseStorage.instanceFor(
          bucket: "gs://clasemoviles-804f9.appspot.com");

      List<String> downloadURLs = [];

      for (File file in files) {
        Uint8List fileBytes = await file.readAsBytes();
        String fileName = file.path.split('/').last;

        // Upload file
        if (FirebaseAuth.instance.currentUser != null) {
          TaskSnapshot uploadTask = await storage
              .ref('${FirebaseAuth.instance.currentUser!.uid}/$fileName')
              .putData(fileBytes);

          String downloadURL = await uploadTask.ref.getDownloadURL();
          downloadURLs.add(downloadURL);
        } else {
          print("Hola mi precioso, así no es");
        }
      }

      CollectionReference chatMessagesCollection = FirebaseFirestore.instance
          .collection('chats')
          .doc('rF0usnlBtQUyAPplpT3H')
          .collection('messages');

      Map<String, dynamic> content = {
        'Mensaje de Juan': '${downloadURLs.join(', ')}'
      };
      Timestamp timestamp = Timestamp.now();

      await chatMessagesCollection.add({
        'content': content,
        'createdAt': timestamp,
        'senderId': '789',
        'senderName': 'Juan',
      });
    }
  } catch (e) {
    print('Error al agregar el mensaje: $e');
  }
}

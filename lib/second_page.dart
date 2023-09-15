import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String myText;
  const SecondPage({super.key, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: ListView(children: [
        Text('Dato recibido: ${myText}'),
        MaterialButton(
          child: Text('Go back to first page'),
          color: Colors.green,
          onPressed: () {
            Navigator.of(context).pop(
                "Dato de regreso"); //El pop puede retornar cualquier tipo de dato.
          },
        )
      ]),
    );
  }
}

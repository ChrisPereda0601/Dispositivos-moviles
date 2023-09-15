import 'package:flutter/material.dart';
import 'package:simple_navigation/second_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var contr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: contr,
          ),
          MaterialButton(
            child: Text('Go to second page'),
            color: Colors.yellow,
            onPressed: () async {
              //Navigate to second page.
              var dato;
              dato = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondPage(myText: contr.text),
                ),
              );
              print("Valor recibido: $dato");
            },
          ),
        ]),
      ),
    );
  }
}

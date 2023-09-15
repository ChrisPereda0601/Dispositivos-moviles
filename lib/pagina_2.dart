import 'package:flutter/material.dart';
import 'dart:math';

class PaginaDos extends StatefulWidget {
  final String myText;
  const PaginaDos({super.key, required this.myText});

  @override
  State<PaginaDos> createState() => _PaginaDosState();
}

class _PaginaDosState extends State<PaginaDos> {
  int _aleatorio = 0;
  void numAleatorio() {
    _aleatorio = Random().nextInt(1000) + 1;
  }

  @override
  Widget build(BuildContext context) {
    String _concatenado = widget.myText + _aleatorio.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 70, 172, 255),
              Color.fromARGB(255, 143, 209, 238)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Genere un número aleatorio",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_aleatorio",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    numAleatorio();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "Generar",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(_concatenado);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      "Guardar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

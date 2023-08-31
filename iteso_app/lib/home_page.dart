import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color icono1 = Colors.black;
  Color icono2 = Colors.black;
  Color icono3 = Colors.black;
  Color icono4 = Colors.black;
  Color icono5 = Colors.black;

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App ITESO'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                  "https://iteso.mx/image/journal/article?img_id=22944475&t=1607996700022"),
              ListTile(
                title: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: Text("San Pedro Tlaquepaque, Jal"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          _count++;
                          setState(() {
                            icono4 = Colors.indigo;
                          });
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: icono4,
                        )),
                    Text("$_count"),
                    IconButton(
                      onPressed: () {
                        if (_count > 0) {
                          _count--;
                        }
                        setState(() {
                          icono5 = Colors.indigo;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_down,
                        color: icono5,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {
                            setState(() {
                              icono1 = (icono1 == Colors.black)
                                  ? Colors.indigo
                                  : Colors.black;
                            });
                            print("Correo del iteso es: ...");
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: Text(
                                      "Puedes enviar un correo con este ícono.")));
                          },
                          icon: Icon(
                            Icons.mail,
                            color: icono1,
                          )),
                      Text("Correo"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {
                            setState(() {
                              icono2 = (icono2 == Colors.black)
                                  ? Colors.indigo
                                  : Colors.black;
                            });
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: Text(
                                      "Puedes pedir información en rectoría.")));
                          },
                          icon: Icon(
                            Icons.phone_bluetooth_speaker,
                            color: icono2,
                          )),
                      Text("Llamada"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {
                            setState(() {
                              icono3 = (icono3 == Colors.black)
                                  ? Colors.indigo
                                  : Colors.black;
                            });
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: Text(
                                      "Se encuentra ubicado en Periférico Sur 8585.")));
                          },
                          icon: Icon(
                            Icons.directions,
                            color: icono3,
                          )),
                      Text("Ruta"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 64),
              Text(
                  '''La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. 
La universidad es nombrada como la Universidad Jesuita de Guadalajara''',
                  textAlign: TextAlign.justify)
            ],
          ),
        ));
  }
}

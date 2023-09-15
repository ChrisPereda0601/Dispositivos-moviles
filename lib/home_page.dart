import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:repaso_pdm/pagina_2.dart';
import 'package:repaso_pdm/pagina_3.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contr = TextEditingController();

  String pagina1 = "";
  String pagina2 = "";
  int _contador = 0;

  _HomePageState() {
    loadFont();
  }

  Future<void> loadFont() async {
    final fontData = await rootBundle.load('assets/The California.ttf');
    final font = FontLoader('california')..addFont(Future.value(fontData));
    await font.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BIENVENIDOS",
                    style: TextStyle(
                      fontFamily: 'california',
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              Image.asset('assets/image1.png'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Seleccione la acción a realizar: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Ingrese datos"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: contr,
                                    decoration: InputDecoration(
                                      hintText: "Ingrese palabra",
                                    ),
                                    style: TextStyle(fontSize: 16),
                                    onChanged: (text) {
                                      setState(() {
                                        _contador = text.length;
                                      });
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "$_contador/10",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(contr.text);
                                        },
                                        child: Text(
                                          "Cancelar",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          final result =
                                              await Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PaginaDos(myText: contr.text),
                                            ),
                                          );
                                          if (result != null) {
                                            setState(() {
                                              pagina1 = result;
                                            });
                                          }
                                        },
                                        child: Text(
                                          "Aceptar",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("Página 2"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final result2 = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaginaTres(),
                        ),
                      );
                      if (result2 != null) {
                        setState(() {
                          pagina2 = result2;
                        });
                      }
                    },
                    child: Text("Página 3"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Text("Pg.2 =>  $pagina1"),
                  SizedBox(height: 13),
                  Text("Pg.3 =>  $pagina2"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

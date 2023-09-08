import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> _elements = [
    {"day": "Day 1", "name": "Templos de Angkor", "image": 'assets/templo.jpg'},
    {
      "day": "Day 2",
      "name": "Gran barrera de coral",
      "image": 'assets/coral.jpeg'
    },
    {
      "day": "Day 3",
      "name": "Machu Picchu",
      "image": 'assets/Machu_Picchu.jpg'
    },
    {
      "day": "Day 4",
      "name": "Gran muralla china",
      "image": 'assets/muralla.jpg'
    },
    {"day": "Day 5", "name": "Taj Mahal", "image": 'assets/Taj_Mahal.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(15), //Esquinas redondeadas
                  child: Image.asset(
                    'assets/hotel.avif',
                    height: MediaQuery.of(context).size.height /
                        4, //Ocupa un cuarto del espacio de la pantalla
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _elements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            placeMap: _elements[index],
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                              content: Text("Reservación en progreso")));
                      },
                      child: Text(
                        "Start booking",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

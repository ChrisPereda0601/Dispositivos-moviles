import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color icono1 = Colors.black;
  Color icono2 = Colors.black;
  Color icono3 = Colors.black;
  Color icono4 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.account_circle, size: 48),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Flutter McFlutter",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Experienced App Developer"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Text("123 Main Street"),
                Spacer(),
                Text("(415) 555-019"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      icono1 = (icono1 == Colors.black)
                          ? Colors.indigo
                          : Colors.black;
                    });
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          content: Text("Ícono de persona presionado...")));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.accessibility,
                        color: icono1,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      icono2 = (icono2 == Colors.black)
                          ? Colors.indigo
                          : Colors.black;
                    });
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          content: Text("Ícono de timer presionado...")));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.timer,
                        color: icono2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      icono3 = (icono3 == Colors.black)
                          ? Colors.indigo
                          : Colors.black;
                    });
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          content: Text("Ícono de android presionado...")));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: icono3,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      icono4 = (icono4 == Colors.black)
                          ? Colors.indigo
                          : Colors.black;
                    });
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          content: Text("Ícono de Iphone presionado...")));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.phone_iphone,
                        color: icono4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

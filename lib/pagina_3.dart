import 'package:flutter/material.dart';

class PaginaTres extends StatelessWidget {
  const PaginaTres({super.key});
  final _texto1 = "(づ｡◕‿‿◕｡)づ";
  final _texto2 = "(̿▀̿‿ ̿▀̿ ̿)";
  final _texto3 = "(╯°□°)╯";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_texto1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                "(づ｡◕‿‿◕｡)づ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_texto2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text("(̿▀̿‿ ̿▀̿ ̿)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_texto3);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                "(╯°□°)╯",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

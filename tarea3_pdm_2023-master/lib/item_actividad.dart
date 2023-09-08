import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final Map<String, String> placeMap;
  ItemActividad({
    super.key,
    required this.placeMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_image(), _title(), _name()],
      ),
    );
  }

  Widget _title() {
    return Text(
      "${placeMap["day"]}",
      style: TextStyle(fontSize: 11),
    );
  }

  Widget _name() {
    return Text(
      "${placeMap["name"]}",
      style: TextStyle(fontSize: 15),
    );
  }

  Widget _image() {
    return Image.asset(
      "${placeMap["image"]}",
      height: 120,
      width: 120,
      fit: BoxFit.cover,
    );
  }
}

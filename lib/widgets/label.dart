import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;
  const Label(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
  }
}

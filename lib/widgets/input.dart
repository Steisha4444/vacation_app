import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;

  const Input({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vacation_app/widgets/banner.dart' as banner;
import 'package:vacation_app/widgets/form.dart';

class requestScreen extends StatelessWidget {
  const requestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          banner.Banner(vacationDays: 12),
          FormRequest(),
        ],
      ),
    );
  }
}

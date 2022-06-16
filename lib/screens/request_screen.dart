import 'package:flutter/material.dart';
import 'package:vacation_app/widgets/banner.dart' as banner;
import 'package:vacation_app/widgets/form_request.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 218, 200, 247),
              Color.fromARGB(255, 172, 159, 214),
            ],
          ),
        ),
        child: Column(
          children: [
            banner.Banner(vacationDays: 4),
            Expanded(child: RequestForm()),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/controllers/request_controller.dart';

class Banner extends StatelessWidget {
  final vacationDays;
  Banner({Key? key, required this.vacationDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Запит на відпустку',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('на даний момент у тебе накопичено',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  vacationDays.toString() + ' днів відпустки',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Text(' з 15 доступних',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  minHeight: 12,
                  color: vacationDays > 10
                      ? Color.fromARGB(255, 129, 23, 23)
                      : Color.fromARGB(255, 58, 23, 129),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  value: vacationDays / 15,
                  // value: 3 / 15,
                ),
              ),
            ),
            vacationDays > 10
                ? Text('Час у відпустку, неустанна волоцюго ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ))
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

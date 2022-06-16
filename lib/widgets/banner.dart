// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Banner extends StatelessWidget {
  final int vacationDays;
  const Banner({Key? key, required this.vacationDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Запит на відпустку',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text('на даний момент у тебе накопичено',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            SizedBox(
              height: 15,
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
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  minHeight: 12,
                  color: Color.fromARGB(255, 58, 23, 129),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  value: vacationDays / 15,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

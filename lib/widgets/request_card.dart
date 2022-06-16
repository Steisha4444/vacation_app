import 'package:flutter/material.dart';
import 'package:vacation_app/models/vacation_request.dart';

class RequestCard extends StatelessWidget {
  final VacationRequest request;
  const RequestCard({required this.request, Key? key}) : super(key: key);

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Від:'),
            Text('Дата:'),
            Text('К-ть днів:'),
            Text('Коментар:'),
          ],
        ),
        Column(
          children: [
            Text(request.sentFromName),
            Text(
                '${_formatDate(request.dateRange.start)}-${_formatDate(request.dateRange.end)}'),
            Text(
              '${request.dateRange.end.difference(request.dateRange.start).inDays}',
            ),
            Text(request.comment ?? ''),
          ],
        )
      ]),
    );
  }
}

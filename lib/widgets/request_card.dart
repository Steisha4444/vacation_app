import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/models/request_status.dart';
import 'package:vacation_app/models/vacationType.dart';
import 'package:vacation_app/models/vacation_request.dart';

class RequestCard extends StatelessWidget {
  final VacationRequest request;
  final Function confimRequest;
  final Function rejectRequest;
  RequestCard(
      {required this.request,
      required this.confimRequest,
      required this.rejectRequest,
      Key? key})
      : super(key: key);

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Color _getBackgroundColor() {
    print(request.managerId.trim());
    print(user.toString());
    if (request.status == RequestStatus.confirmed) {
      return const Color.fromARGB(255, 195, 237, 197);
    } else if (request.status == RequestStatus.rejected) {
      return const Color.fromARGB(255, 255, 190, 185);
    }
    return const Color.fromARGB(255, 221, 218, 218);
  }

  final user = Get.find<LoginController>().googleAccount.value!.email;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _getBackgroundColor()),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Від:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Дата:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'К-ть днів:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Коментар:',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(request.sentFromName),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${_formatDate(request.dateRange.start)}-${_formatDate(request.dateRange.end)}'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${request.dateRange.end.difference(request.dateRange.start).inDays}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(request.comment ?? ''),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                (request.managerId.trim() == user.toString().trim() &&
                        request.status == RequestStatus.review)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // (request.managerId == user) :
                        children: [
                          IconButton(
                            icon: (request.status != RequestStatus.confirmed)
                                ? const Icon(Icons.thumb_up_alt_outlined)
                                : const Icon(Icons.thumb_up),
                            color: Colors.green,
                            onPressed: () => confimRequest(request.id),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          IconButton(
                            icon: (request.status != RequestStatus.rejected)
                                ? const Icon(Icons.thumb_down_alt_outlined)
                                : const Icon(Icons.thumb_down),
                            color: Colors.red,
                            onPressed: () => rejectRequest(request.id),
                          )
                        ],
                      )
                    : const SizedBox(
                        height: 10,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

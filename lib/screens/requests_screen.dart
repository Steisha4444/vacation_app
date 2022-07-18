import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/notification_controller.dart';
import 'package:vacation_app/widgets/request_card.dart';

class RequestsScreen extends GetView<NotificationController> {
  RequestsScreen({Key? key}) : super(key: key);

  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 200, 247),
      appBar: AppBar(
        title: Align(
          child: Text('Сповіщення'),
          alignment: Alignment.topLeft,
        ),
        backgroundColor: Color.fromARGB(255, 218, 200, 247),
        elevation: 0,
      ),
      body: GetBuilder<NotificationController>(
        builder: (_) {
          final requests = [
            ...controller.toConfirmRequests,
            ...controller.myRequests
          ].reversed.toList();
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, idx) => Column(
                children: [
                  RequestCard(
                    request: requests[idx],
                    rejectRequest: controller.onRejectRequest,
                    confimRequest: controller.onConfirnRequest,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

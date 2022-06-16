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
      body: GetBuilder<NotificationController>(
        builder: (_) {
          final requests = [
            ...controller.toConfirmRequests,
            ...controller.myRequests
          ];
          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, idx) => RequestCard(request: requests[idx]),
          );
        },
      ),
    );
  }
}

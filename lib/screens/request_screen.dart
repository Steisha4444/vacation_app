import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/controllers/request_controller.dart';
import 'package:vacation_app/widgets/banner.dart' as banner;
import 'package:vacation_app/widgets/request_form.dart';

class RequestScreen extends GetView<LoginController> {
  RequestScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (_) => Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 218, 200, 247),
                Color.fromARGB(255, 172, 159, 214),
              ],
            ),
          ),
          child: Column(
            children: [
              banner.Banner(
                vacationDays: controller.user?.vacationDays,
              ),
              Expanded(child: RequestForm()),
            ],
          ),
        ),
      ),
    );
  }
}

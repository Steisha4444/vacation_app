import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/home_controller.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/screens/request_screen.dart';
import 'package:vacation_app/screens/requests_screen.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  Widget getScreen() {
    switch (controller.page) {
      case 0:
        return RequestsScreen();
      case 2:
        Get.find<LoginController>().logout();
        return Container();
      default:
        return RequestScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
          body: getScreen(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 218, 200, 247),
            onTap: controller.onNavigate,
            currentIndex: controller.page,
            selectedIconTheme: IconThemeData(
                size: 32, color: Color.fromARGB(255, 72, 22, 148)),
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.notifications_outlined),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.add_circle_outline),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.logout),
              ),
            ],
          )),
    );
  }
}

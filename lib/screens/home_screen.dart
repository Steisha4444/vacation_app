import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/controllers/home_controller.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/screens/request_screen.dart';
import 'package:vacation_app/screens/requests_screen.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final loginController = Get.find<LoginController>();

  HomeScreen({Key? key}) : super(key: key);

  Widget getScreen() {
    switch (controller.page) {
      case 0:
        return RequestsScreen();
      case 2:
        loginController.logout();
        controller.onNavigate(0);
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
            fixedColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 218, 200, 247),
            onTap: controller.onNavigate,
            currentIndex: controller.page,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: const IconThemeData(
              size: 32,
              color: Color.fromARGB(255, 72, 22, 148),
            ),
            items: const [
              BottomNavigationBarItem(
                label: 'Сповіщення',
                icon: Icon(Icons.notifications_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Подати запит',
                icon: Icon(Icons.add_circle_outline),
              ),
              // IconButton(icon:  Icon(Icons.logout), onPressed:  loginController.logout();,)
              BottomNavigationBarItem(
                label: 'Вийти',
                icon: Icon(Icons.logout),
              ),
            ],
          )),
    );
  }
}

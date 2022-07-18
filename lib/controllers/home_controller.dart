import 'package:get/get.dart';
import 'package:vacation_app/controllers/login_controller.dart';

class HomeController extends GetxController {
  int page = 0;
  void onNavigate(int page) {
    this.page = page;
    update();
  }
}

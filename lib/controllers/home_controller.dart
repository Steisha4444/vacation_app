import 'package:get/get.dart';

class HomeController extends GetxController {
  int page = 0;
  void onNavigate(int page) {
    this.page = page;
    update();
  }
}

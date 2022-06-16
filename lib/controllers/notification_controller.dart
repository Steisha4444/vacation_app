import 'package:get/get.dart';
import 'package:vacation_app/api/request_api.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/models/vacation_request.dart';

class NotificationController extends GetxController {
  List<VacationRequest> toConfirmRequests = [];
  List<VacationRequest> myRequests = [];

  Future<void> fetchData() async {
    final user = Get.find<LoginController>().googleAccount.value!.email;
    List<VacationRequest> requests = await RequestApi.getUserRequests(
      user,
    );
    toConfirmRequests =
        requests.where((element) => element.managerId == user).toList();
    myRequests =
        requests.where((element) => element.sentFromEmail == user).toList();
    update();
  }
}

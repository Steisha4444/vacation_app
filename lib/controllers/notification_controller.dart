import 'package:get/get.dart';
import 'package:vacation_app/api/request_api.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/models/request_status.dart';
import 'package:vacation_app/models/vacation_request.dart';

class NotificationController extends GetxController {
  List<VacationRequest> toConfirmRequests = [];
  List<VacationRequest> myRequests = [];
  List<VacationRequest> allRequests = [];

  Future<void> fetchData() async {
    final user = Get.find<LoginController>().googleAccount.value!.email;
    List<VacationRequest> requests = await RequestApi.getUserRequests(
      user,
    );
    toConfirmRequests =
        requests.where((element) => element.managerId == user).toList();
    myRequests =
        requests.where((element) => element.sentFromEmail == user).toList();
    allRequests = requests;
    update();
  }

  onConfirnRequest(String id) async {
    VacationRequest request =
        allRequests.firstWhere((element) => element.id == id);
    request.status = RequestStatus.confirmed;
    await RequestApi.updateRequest(request);
    update();
  }

  onRejectRequest(String id) async {
    VacationRequest request =
        allRequests.firstWhere((element) => element.id == id);
    request.status = RequestStatus.rejected;
    await RequestApi.updateRequest(request);
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacation_app/api/request_api.dart';
import 'package:vacation_app/api/users_api.dart';
import 'package:vacation_app/controllers/login_controller.dart';
import 'package:vacation_app/models/user.dart';
import 'package:vacation_app/models/vacationType.dart';
import 'package:vacation_app/models/vacation_request.dart';

class RequestController extends GetxController {
  List<User> users = [];
  bool isLoading = false;
  VacationType vacationType = VacationType.vacation;
  DateTimeRange? dateRange;
  User? selectedUser;
  String? selectedUsersName;
  final commentController = TextEditingController();

  @override
  void onInit() {
    _fetchData();
    super.onInit();
  }

  bool get isValid => selectedUser != null && dateRange != null;

  void onSelectVacationType(VacationType? value) {
    vacationType = value!;
  }

  void onSelectUser(User? value) {
    selectedUser = value!;
    update();
  }

  void onSelectDateRange(DateTimeRange value) {
    dateRange = value;
    update();
  }

  void show(context) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());

      dateRange = result;
      update();
    }
  }

  Future<void> onSubmit() async {
    isLoading = true;
    final loginController = Get.find<LoginController>(); 
    update();
    final request = VacationRequest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      vacationType: vacationType,
      dateRange: dateRange!,
      managerId: selectedUser!.email,
      comment: commentController.text,
      sentFromEmail: loginController.googleAccount.value!.email,
      sentFromName: loginController.googleAccount.value!.displayName! ,
    );
    await RequestApi.addRequest(request);
    isLoading = false;
    update();
  }

  Future<void> _fetchData() async {
    users = await UsersApi.getUsers();
    update();
  }
}

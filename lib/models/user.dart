import 'package:vacation_app/models/vacation_request.dart';

class User {
  final String id;
  final bool isManager;
  List<VacationRequest> personalVacation = [];
  List<VacationRequest> vacationForReview = [];

  User(this.id, this.isManager);
}

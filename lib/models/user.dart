import 'dart:convert';

import 'package:vacation_app/models/vacation_request.dart';

class User {
  final String email;
  final String fullName;
  final bool isManager;
  final int vacationDays;

  User({
    required this.email,
    required this.fullName,
    required this.isManager,
    required this.vacationDays,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'isManager': isManager,
      'vacationDays': vacationDays,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      isManager: map['isManager'] ?? false,
      vacationDays: map['vacationDays']?.toInt() ?? 0,
    );
  }

  
}

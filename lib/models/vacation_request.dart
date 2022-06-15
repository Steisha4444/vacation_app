import 'package:flutter/material.dart';
import 'package:vacation_app/models/vacationType.dart';

class VacationRequest {
  final String id;
  final VacationType vacationType;
  final DateTimeRange dataRange;
  final String managerId;
  final String? comment;
  final bool isConfirmed;

  VacationRequest({
    required this.id,
    required this.isConfirmed,
    required this.vacationType,
    required this.dataRange,
    required this.managerId,
    this.comment,
  });
}

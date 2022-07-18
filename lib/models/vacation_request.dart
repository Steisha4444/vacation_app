import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vacation_app/models/request_status.dart';
import 'package:vacation_app/models/vacationType.dart';

class VacationRequest {
  final String id;
  final VacationType vacationType;
  final DateTimeRange dateRange;
  final String managerId;
  final String? comment;
  final String sentFromEmail;
  final String sentFromName;
  RequestStatus status;

  VacationRequest({
    required this.id,
    this.status = RequestStatus.review,
    required this.sentFromEmail,
    required this.sentFromName,
    required this.vacationType,
    required this.dateRange,
    required this.managerId,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vacationType': vacationType.toJson(),
      'dateRange': [
        dateRange.start.toString(),
        dateRange.end.toString(),
      ],
      'managerId': managerId,
      'sentFromEmail': sentFromEmail,
      'sentFromName': sentFromName,
      'comment': comment,
      'status': status.toJson(),
    };
  }

  factory VacationRequest.fromJson(Map<String, dynamic> map) {
    final dateRange =
        (map['dateRange'] as List).map((e) => DateTime.tryParse(e as String));
    return VacationRequest(
      id: map['id'] ?? '',
      vacationType:
          VacationTypeExtension.fromJson(map['vacationType'] as String),
      dateRange: DateTimeRange(
        start: dateRange.first!,
        end: dateRange.last!,
      ),
      managerId: map['managerId'] ?? '',
      comment: map['comment'],
      sentFromEmail: map['sentFromEmail'],
      sentFromName: map['sentFromName'],
      status: RequestStatusExtension.fromJson(map['status']),
    );
  }
}

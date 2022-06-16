import 'package:flutter/foundation.dart';

enum RequestStatus {
  confirmed,
  rejected,
  review,
}

extension RequestStatusExtension on RequestStatus {
  static final Map<String, RequestStatus> _fromJsonMap = {
    'confirmed': RequestStatus.confirmed,
    'rejected': RequestStatus.rejected,
    'review': RequestStatus.review,
  };
  String toJson() => this.toString().split('.').last;
  static RequestStatus fromJson(String value) => _fromJsonMap[value]!;
}

import 'package:flutter/foundation.dart';

enum VacationType { vacation, unpaidVacation, sickLeave }

extension VacationTypeExtension on VacationType {
  static final Map<String, VacationType> _fromJsonMap = {
    'vacation': VacationType.vacation,
    'unpaidVacation': VacationType.unpaidVacation,
    'sickLeave': VacationType.sickLeave,
  };
  String toJson() => this.toString().split('.').last;

  static VacationType fromJson(String value) => _fromJsonMap[value]!;

  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case VacationType.vacation:
        return 'Відпустка';
      case VacationType.unpaidVacation:
        return 'Відпустка за свій рахунок';
      case VacationType.sickLeave:
        return 'Лікарняний';
      default:
        return 'something went wrong';
    }
  }
}

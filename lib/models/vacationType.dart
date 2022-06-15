import 'package:flutter/foundation.dart';

enum VacationType {
  vacation,
  unpaidVacation,
}

extension VacationTypeExtension on VacationType {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case VacationType.vacation:
        return 'Відпустка';
      case VacationType.unpaidVacation:
        return 'Відпустка за свій рахунок';
      default:
        return 'something went wrong';
    }
  }
}

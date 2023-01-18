import 'package:jiffy/jiffy.dart';

extension JiffyExtension on Jiffy {
  Jiffy toJiffyWithTimezoneSetting(String offSet) {
    var jiffy = this;
    utc();
    var timezoneOffset = offSet;
    if (timezoneOffset.isEmpty) {
      timezoneOffset = '+00:00';
    }
    final regexMatchOffsetFormat = RegExp(r'^[+-]?([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (!regexMatchOffsetFormat.hasMatch(timezoneOffset)) {
      timezoneOffset = '+00:00';
    }
    final symbol = timezoneOffset.substring(0, 1);
    final hours = int.parse(timezoneOffset.substring(1, 3));
    final minutes = int.parse(timezoneOffset.substring(4, 6));
    if (symbol == '+') {
      jiffy.add(
        hours: hours,
        minutes: minutes,
      );
    } else {
      jiffy.subtract(
        hours: hours,
        minutes: minutes,
      );
    }
    return jiffy;
  }
}

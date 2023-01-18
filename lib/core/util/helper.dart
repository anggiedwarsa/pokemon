import 'package:pokemon/core/util/shared_preferences_manager.dart';

class Helper {
  final SharedPreferencesManager sharedPreferencesManager;

  Helper({required this.sharedPreferencesManager});

  bool checkValidationEmail(String email) {
    var isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isEmailValid;
  }

  String convertToCapitalize(String string) {
    var listWord = string.split(' ');
    var output = '';
    for (var word in listWord) {
      output += '${word[0].toUpperCase()}${word.substring(1, word.length)} ';
    }
    return output.trim();
  }

  Map<String, dynamic> convertDurationToWord(int seconds) {
    var hour = seconds ~/ 3600;
    var minute = (seconds % 3600) ~/ 60;
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  DateTime getStartWeek(DateTime dateTime) {
    var weekday = dateTime.weekday;
    if (weekday == 7) {
      return dateTime;
    } else {
      return dateTime.subtract(Duration(days: weekday - 1));
    }
  }

  DateTime getLastWeek(DateTime dateTime) {
    var weekday = dateTime.weekday;
    if (weekday == 7) {
      return dateTime.add(const Duration(
        days: 6,
      ));
    } else {
      return dateTime.add(Duration(
        days: DateTime.daysPerWeek - weekday,
      ));
    }
  }

  String getTimeGreetingLabel(DateTime dateTime) {
    var hour = dateTime.hour;
    String greetingLabel = '';
    if (hour >= 0 && hour <= 10) {
      greetingLabel = 'morning';
    } else if (hour >= 11 && hour <= 14) {
      greetingLabel = 'noon';
    } else if (hour >= 15 && hour <= 18) {
      greetingLabel = 'afternoon';
    } else if (hour >= 19 && hour <= 23) {
      greetingLabel = 'evening';
    }
    return greetingLabel;
  }
}

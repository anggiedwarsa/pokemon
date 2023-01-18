import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'constant_error_message.dart';

extension StringExtension on String {
  String convertErrorMessageToHumanMessage(BuildContext context) {
    var string = this;
    if (string == ConstantErrorMessage().connectionError) {
      return 'connection_error'.tr();
    } else if (string.contains(ConstantErrorMessage().connectionRefused)) {
      return 'connection_refused'.tr();
    } else {
      return string;
    }
  }

  String hideResponseCode() {
    var string = this;
    if (string.startsWith(RegExp('^([0-9]{3})'))) {
      return string.substring(3, string.length).trim();
    } else {
      return string;
    }
  }

  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');

  String getFirstName() => length > 0 ? split(' ')[0] : '';

  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsNumber => contains(RegExp(r'[0-9]'));

  bool get containsSpecialChar => contains(RegExp(r'[~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]]'));
}

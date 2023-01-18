import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget ini berfungsi untuk menampilkan widget [CircularProgressIndicator] <br />
/// dan [CupertinoActivityIndicator] sesuai dengan style native-nya masing-masing yaitu material dan cupertino. <br />
/// Dan meletakkannya ditengah-tengah.
class WidgetLoadingCenter extends StatelessWidget {
  final double? value;

  const WidgetLoadingCenter({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(
              value: value,
            ),
    );
  }
}

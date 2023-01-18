import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WidgetLoadMoreTryAgain extends StatelessWidget {
  final Function() onTap;

  WidgetLoadMoreTryAgain({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'tap_to_try_again'.tr(),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 8),
            Icon(Icons.refresh),
          ],
        ),
      ),
    );
  }
}

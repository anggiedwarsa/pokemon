import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/util/string_extension.dart';
import 'package:pokemon/core/util/styles/colors.dart';
import 'package:pokemon/features/presentation/widgets/widget_dialog.dart';

/// Class ini berfungsi untuk melakukan utilitas-utilitas terhadap widget.<br /><br />
class WidgetHelper {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: BaseColor.successColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ),
    );
  }

  void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: BaseColor.errorColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ),
    );
  }

  Future<bool?> showDialogServerFailure(
    BuildContext context,
    String errorMessage, {
    String? title,
    bool isTryAgain = true,
    String? labelNegativeButton,
  }) async {
    final actionsAlertDialog = <TextButton>[];
    final actionsCupertinoDialog = <CupertinoDialogAction>[];
    if (isTryAgain) {
      actionsAlertDialog
        ..add(
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(labelNegativeButton?.toUpperCase() ?? 'back'.tr().toUpperCase()),
          ),
        )
        ..add(
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('try_again'.tr().toUpperCase()),
          ),
        );
      actionsCupertinoDialog
        ..add(
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text(labelNegativeButton ?? 'back'.tr()),
          ),
        )
        ..add(
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context, true),
            child: Text('try_again'.tr()),
          ),
        );
    } else {
      actionsAlertDialog.add(
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(labelNegativeButton?.toUpperCase() ?? 'back'.tr().toUpperCase()),
        ),
      );
      actionsCupertinoDialog.add(
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context, false),
          child: Text(labelNegativeButton ?? 'back'.tr()),
        ),
      );
    }
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WidgetDialog(
          title: title ?? 'info'.tr(),
          content: errorMessage.hideResponseCode(),
          actionsAlertDialog: actionsAlertDialog,
          actionsCupertinoDialog: actionsCupertinoDialog,
        );
      },
    );
  }

  ScrollPhysics? adaptiveScrollPhysics() =>
      Platform.isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics();
}

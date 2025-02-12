import 'package:flutter/material.dart';

import '../presentation/widgets/top_dialog.dart';
import '../styles/durations.dart';

class DialogService {
  static void showTopInfoDialog(BuildContext context, String message) {
    showTopDialog(context, message);
  }

  static void showTopSuccessDialog(BuildContext context, String message) {
    showTopDialog(context, message, dialogType: TopDialogType.SUCCESS);
  }

  static void showTopWarningDialog(BuildContext context, String message) {
    showTopDialog(context, message, dialogType: TopDialogType.WARNING);
  }

  static void showTopErrorDialog(BuildContext context, String message) {
    showTopDialog(context, message, dialogType: TopDialogType.ERROR);
  }

  static void showTopDialog(
      BuildContext context,
      String message, {
        TopDialogType dialogType = TopDialogType.INFO,
      }) {
    _showOverlay(
      context,
      TopInfoDialog(dialogType: dialogType, message: message),
    );
  }

  static void _showOverlay(BuildContext context, Widget dialog) {
    final OverlayState overlay = Overlay.of(context);

    final OverlayEntry overlayEntry = OverlayEntry(builder: (BuildContext context) => dialog);
    overlay.insert(overlayEntry);

    Future.delayed(AppDurations.topDialog.mainDuration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

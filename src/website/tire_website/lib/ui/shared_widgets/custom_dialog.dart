import 'package:flutter/material.dart';

import '../shared_widgets/custom_text.dart';

class CustomWarningDialog {
  static void showCustomDialog({
    BuildContext context,
    String title,
    String message,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Center(child: Text(title)),
          content: CustomText(
            text: message,
            size: 16.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w300,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  static void showSnackBar({
    BuildContext context,
    String message,
    bool warning = true,
  }) {
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: warning ? Colors.red : Colors.green,
        duration:
            warning ? const Duration(seconds: 2) : const Duration(seconds: 1),
      ),
    );
  }
}

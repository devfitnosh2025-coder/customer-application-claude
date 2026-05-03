import 'dart:io';

import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KAdaptiveAlertDialogBox extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback onCancelTap;
  final VoidCallback onConfirmTap;
  final bool isDestructive;

  const KAdaptiveAlertDialogBox({
    super.key,
    required this.title,
    required this.content,
    required this.cancelText,
    required this.confirmText,
    required this.onCancelTap,
    required this.onConfirmTap,
    this.isDestructive = true,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              HapticFeedback.heavyImpact();
              onCancelTap();
            },
            child: Text(cancelText),
          ),
          CupertinoDialogAction(
            isDestructiveAction: isDestructive,
            onPressed: () {
              HapticFeedback.heavyImpact();
              onConfirmTap();
            },
            child: Text(confirmText),
          ),
        ],
      );
    }
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            HapticFeedback.heavyImpact();
            onCancelTap();
          },
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: () {
            HapticFeedback.heavyImpact();
            onConfirmTap();
          },
          child: Text(
            confirmText,
            style: TextStyle(
              color: isDestructive ? AppTheme.errorColor : AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

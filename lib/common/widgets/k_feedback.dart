import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class KFeedback {
  static void show(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTheme.caTextPrimary,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        duration: const Duration(milliseconds: 1600),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppTheme.secondaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

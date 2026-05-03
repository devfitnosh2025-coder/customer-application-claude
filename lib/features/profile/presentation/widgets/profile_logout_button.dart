import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileLogoutButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ProfileLogoutButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: AppTheme.transparentColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            HapticFeedback.heavyImpact();
            onTap();
          },
          child: Container(
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDark
                  ? AppTheme.darkSurfaceColor
                  : const Color(0xFFFAEDED),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark
                    ? AppTheme.darkBorderColor
                    : const Color(0xFFF1D9D9),
                width: 1,
              ),
            ),
            child: Text(
              label,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF8B2E2E),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

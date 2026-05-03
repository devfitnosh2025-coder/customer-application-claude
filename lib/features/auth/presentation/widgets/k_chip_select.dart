import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KChipSelect extends StatelessWidget {
  final String label;
  final bool selected;
  final Color selectedBg;
  final Color selectedFg;
  final VoidCallback onTap;

  const KChipSelect({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.selectedBg = AppTheme.primaryColor,
    this.selectedFg = AppTheme.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? selectedBg
              : (isDark
                  ? AppTheme.darkSurfaceColor
                  : AppTheme.contentCard),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? selectedBg
                : (isDark
                    ? AppTheme.darkBorderColor
                    : AppTheme.contentCardBorder),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: selected
                ? selectedFg
                : (isDark
                    ? AppTheme.secondaryColor
                    : AppTheme.caTextPrimary),
          ),
        ),
      ),
    );
  }
}

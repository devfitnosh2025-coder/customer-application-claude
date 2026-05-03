import 'package:customer_app/common/widgets/k_bottom_sheet.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> showAddressSheet(BuildContext context) =>
    showKBottomSheet(context: context, child: const _AddressSheet());

class _AddressSheet extends StatefulWidget {
  const _AddressSheet();

  @override
  State<_AddressSheet> createState() => _AddressSheetState();
}

class _AddressSheetState extends State<_AddressSheet> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    final addresses = [
      (appLoc.home, '12, Gandhi Nagar, Gandhipuram, Coimbatore'),
      (appLoc.office, '3rd Floor, Tech Park, RS Puram, Coimbatore'),
      (appLoc.gym, 'FitZone, Saibaba Colony, Coimbatore'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Text(
          appLoc.deliveryAddress,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppTheme.secondaryColor
                : AppTheme.caTextPrimary,
          ),
        ),
        for (var i = 0; i < addresses.length; i++)
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              HapticFeedback.heavyImpact();
              setState(() => _selected = i);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                spacing: 10,
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selected == i
                            ? AppTheme.primaryColor
                            : AppTheme.caTextMuted,
                        width: 2,
                      ),
                      color: _selected == i
                          ? AppTheme.primaryColor
                          : AppTheme.transparentColor,
                    ),
                    child: _selected == i
                        ? const Icon(Icons.check,
                            size: 12, color: AppTheme.secondaryColor)
                        : null,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Text(
                          addresses[i].$1,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.caTextPrimary,
                          ),
                        ),
                        Text(
                          addresses[i].$2,
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            color: AppTheme.caTextWarmGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();
            GoRouter.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              appLoc.addNewAddress,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

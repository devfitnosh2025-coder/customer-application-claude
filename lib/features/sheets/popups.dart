import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> showReorderPopup(BuildContext context) {
  final theme = Theme.of(context);
  final appLoc = AppLocalizations.of(context)!;
  return showAdaptiveDialog(
    context: context,
    builder: (dialogContext) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppTheme.contentCard,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 14,
          children: [
            Text(
              appLoc.addToCartTitle,
              style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppTheme.caTextPrimary,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.contentBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 12,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE2D1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Text(
                          'Avocado Toast & Eggs',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.caTextPrimary,
                          ),
                        ),
                        Text(
                          '₹249 · 350 cal',
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
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: _btn(theme, appLoc.cancel,
                      bg: AppTheme.contentDivider,
                      fg: AppTheme.caTextPrimary, onTap: () {
                    GoRouter.of(dialogContext).pop();
                  }),
                ),
                Expanded(
                  child: _btn(theme, appLoc.addToCart,
                      bg: AppTheme.primaryColor,
                      fg: AppTheme.secondaryColor, onTap: () {
                    GoRouter.of(dialogContext).pop();
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showSkipPopup(BuildContext context) {
  final theme = Theme.of(context);
  final appLoc = AppLocalizations.of(context)!;
  return showAdaptiveDialog(
    context: context,
    builder: (dialogContext) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppTheme.contentCard,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            Text(
              appLoc.skipLunchTomorrow,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppTheme.caTextPrimary,
              ),
            ),
            Text(
              appLoc.skipDesc,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: AppTheme.caTextWarmGray,
              ),
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: _btn(theme, appLoc.keepIt,
                      bg: AppTheme.contentDivider,
                      fg: AppTheme.caTextPrimary, onTap: () {
                    GoRouter.of(dialogContext).pop();
                  }),
                ),
                Expanded(
                  child: _btn(theme, appLoc.yesSkip,
                      bg: const Color(0xFFB23A48),
                      fg: AppTheme.secondaryColor, onTap: () {
                    GoRouter.of(dialogContext).pop();
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _btn(ThemeData theme, String label,
    {required Color bg, required Color fg, required VoidCallback onTap}) {
  return InkWell(
    borderRadius: BorderRadius.circular(99),
    onTap: () {
      HapticFeedback.heavyImpact();
      onTap();
    },
    child: Container(
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w800,
          color: fg,
        ),
      ),
    ),
  );
}

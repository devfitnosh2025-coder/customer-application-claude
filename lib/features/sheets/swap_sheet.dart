import 'package:customer_app/common/widgets/k_bottom_sheet.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/auth/presentation/widgets/k_chip_select.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> showSwapSheet(BuildContext context) =>
    showKBottomSheet(context: context, child: const _SwapSheet());

class _SwapSheet extends StatefulWidget {
  const _SwapSheet();

  @override
  State<_SwapSheet> createState() => _SwapSheetState();
}

class _SwapSheetState extends State<_SwapSheet> {
  bool _vegOnly = true;
  bool _under600 = false;
  bool _highProtein = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    final items = [
      ('Paneer Tikka Bowl', '480 cal · 18g · 42g'),
      ('Grilled Fish & Rice', '440 cal · 32g · 16g'),
      ('Quinoa Salad Bowl', '380 cal · 12g · 45g'),
      ('Butter Chicken Rice', '620 cal · 36g · 48g'),
      ('Egg Fried Rice', '450 cal · 16g · 52g'),
      ('Dal Tadka + Roti', '420 cal · 18g · 50g'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    appLoc.swapLunch,
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: isDark
                          ? AppTheme.secondaryColor
                          : AppTheme.caTextPrimary,
                    ),
                  ),
                  Text(
                    appLoc.swapLunchSub,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: AppTheme.caTextWarmGray,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: () => GoRouter.of(context).pop(),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          children: [
            KChipSelect(
              label: '✓ ${appLoc.vegOnly}',
              selected: _vegOnly,
              selectedBg: AppTheme.emeraldLight,
              selectedFg: AppTheme.emeraldText,
              onTap: () => setState(() => _vegOnly = !_vegOnly),
            ),
            KChipSelect(
              label: appLoc.under600cal,
              selected: _under600,
              onTap: () => setState(() => _under600 = !_under600),
            ),
            KChipSelect(
              label: appLoc.highProtein,
              selected: _highProtein,
              onTap: () => setState(() => _highProtein = !_highProtein),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 380),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemCount: items.length,
            itemBuilder: (_, i) {
              final (name, meta) = items[i];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.darkBackgroundColor
                      : AppTheme.contentBackground,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppTheme.contentCardBorder,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      meta,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 10,
                        color: AppTheme.caTextWarmGray,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(99),
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        GoRouter.of(context).pop();
                      },
                      child: Container(
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          appLoc.select,
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:customer_app/common/widgets/k_bottom_sheet.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/auth/presentation/widgets/k_chip_select.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> showCustomizeSheet(BuildContext context) =>
    showKBottomSheet(context: context, child: const _CustomizeSheet());

class _CustomizeSheet extends StatefulWidget {
  const _CustomizeSheet();

  @override
  State<_CustomizeSheet> createState() => _CustomizeSheetState();
}

class _CustomizeSheetState extends State<_CustomizeSheet> {
  String _portion = 'medium';
  String _spice = 'spicy';
  String _protein = 'chicken';
  final Set<String> _addOns = {'extraProtein'};
  final Set<String> _excl = {'noOnion'};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            appLoc.customizeChickenBowl,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: isDark
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            appLoc.changesApplyLine,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppTheme.caTextWarmGray,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 14,
                children: [
                  _h(theme, appLoc.portionSize),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: _portionTile(appLoc.small300, 'small'),
                      ),
                      Expanded(
                        child: _portionTile(appLoc.medium350, 'medium'),
                      ),
                      Expanded(
                        child: _portionTile(appLoc.large420, 'large'),
                      ),
                    ],
                  ),
                  _h(theme, appLoc.spiceLevel),
                  Wrap(
                    spacing: 8,
                    children: [
                      _spiceChip('mild', appLoc.mild),
                      _spiceChip('medium', appLoc.medium),
                      _spiceChip('spicy', appLoc.spicy),
                      _spiceChip('extra', appLoc.extra),
                    ],
                  ),
                  _h(theme, appLoc.proteinSwap),
                  Wrap(
                    spacing: 8,
                    children: [
                      _proteinChip('chicken', appLoc.chicken),
                      _proteinChip('paneer', appLoc.paneer),
                      _proteinChip('tofu', appLoc.tofu),
                      _proteinChip('eggs', appLoc.eggsLabel),
                    ],
                  ),
                  _h(theme, appLoc.addOnsLabel),
                  _addOnRow('extraProtein', appLoc.extraProtein, '+₹30'),
                  _addOnRow('sideSalad', appLoc.sideSalad, '+₹20'),
                  _addOnRow('extraDressing', appLoc.extraDressing, '+₹15'),
                  _addOnRow('brownRice', appLoc.brownRiceSwap, '+₹10'),
                  _h(theme, appLoc.exclusions),
                  Wrap(
                    spacing: 8,
                    children: [
                      _exclChip('noOnion', appLoc.noOnion),
                      _exclChip('noGarlic', appLoc.noGarlic),
                      _exclChip('noDairy', appLoc.noDairy),
                      _exclChip('noSpice', appLoc.noSpice),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            borderRadius: BorderRadius.circular(99),
            onTap: () {
              HapticFeedback.heavyImpact();
              GoRouter.of(context).pop();
            },
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                appLoc.saveCustomization,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _h(ThemeData theme, String text) => Text(
        text,
        style: theme.textTheme.headlineMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: AppTheme.caTextPrimary,
        ),
      );

  Widget _portionTile(String label, String key) {
    final selected = _portion == key;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        setState(() => _portion = key);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryColor.withValues(alpha: 0.15)
              : AppTheme.contentBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? AppTheme.primaryColor
                : AppTheme.contentCardBorder,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: selected
                ? AppTheme.primaryColor
                : AppTheme.caTextPrimary,
          ),
        ),
      ),
    );
  }

  Widget _spiceChip(String key, String label) => KChipSelect(
        label: label,
        selected: _spice == key,
        selectedBg: const Color(0xFFE9A23B),
        onTap: () => setState(() => _spice = key),
      );

  Widget _proteinChip(String key, String label) => KChipSelect(
        label: label,
        selected: _protein == key,
        onTap: () => setState(() => _protein = key),
      );

  Widget _exclChip(String key, String label) => KChipSelect(
        label: '$label ✕',
        selected: _excl.contains(key),
        selectedBg: const Color(0xFFFAE0E3),
        selectedFg: const Color(0xFFB23A48),
        onTap: () => setState(() {
          if (!_excl.add(key)) _excl.remove(key);
        }),
      );

  Widget _addOnRow(String key, String label, String price) {
    final theme = Theme.of(context);
    final selected = _addOns.contains(key);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        HapticFeedback.heavyImpact();
        setState(() {
          if (!_addOns.add(key)) _addOns.remove(key);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryColor.withValues(alpha: 0.10)
              : AppTheme.contentBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppTheme.primaryColor : AppTheme.contentCardBorder,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked,
              size: 18,
              color: selected ? AppTheme.primaryColor : AppTheme.caTextMuted,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.caTextPrimary,
                ),
              ),
            ),
            Text(
              price,
              style: theme.textTheme.labelSmall!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: AppTheme.caTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

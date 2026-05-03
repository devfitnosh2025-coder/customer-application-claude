import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/sheets/customize_sheet.dart';
import 'package:customer_app/features/sheets/popups.dart';
import 'package:customer_app/features/sheets/swap_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 240,
                pinned: false,
                backgroundColor: const Color(0xFFE6D5B8),
                leading: IconButton(
                  icon: const CircleAvatar(
                    backgroundColor: AppTheme.secondaryColor,
                    radius: 16,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 14,
                      color: AppTheme.caTextPrimary,
                    ),
                  ),
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    GoRouter.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const CircleAvatar(
                      backgroundColor: AppTheme.secondaryColor,
                      radius: 16,
                      child: Icon(
                        Icons.share_rounded,
                        size: 14,
                        color: AppTheme.caTextPrimary,
                      ),
                    ),
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                    },
                  ),
                  const SizedBox(width: 8),
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  background: ColoredBox(color: Color(0xFFE6D5B8)),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 14,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          _badge(theme, 'Lunch', AppTheme.contentDivider,
                              AppTheme.caTextPrimary),
                          _badge(
                            theme,
                            appLoc.preparing,
                            const Color(0xFFFFE8AF),
                            const Color(0xFFB8860B),
                          ),
                        ],
                      ),
                      Text(
                        appLoc.chickenPowerBowl,
                        style: theme.textTheme.headlineLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? AppTheme.secondaryColor
                              : AppTheme.caTextPrimary,
                        ),
                      ),
                      Text(
                        appLoc.mealDetailDesc,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: AppTheme.caTextWarmGray,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              appLoc.perServing,
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontSize: 12,
                                color: AppTheme.caTextMuted,
                              ),
                            ),
                          ),
                          Text(
                            appLoc.changeBefore,
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFB8860B),
                            ),
                          ),
                        ],
                      ),
                      _SectionH(text: appLoc.nutrition),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: _NutTile(
                              value: '520',
                              label: appLoc.calories,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: _NutTile(
                              value: '42',
                              label: appLoc.protein,
                              color: AppTheme.macroProtein,
                            ),
                          ),
                          Expanded(
                            child: _NutTile(
                              value: '36',
                              label: appLoc.carbs,
                              color: AppTheme.macroCarbs,
                            ),
                          ),
                          Expanded(
                            child: _NutTile(
                              value: '18',
                              label: appLoc.fat,
                              color: AppTheme.macroFat,
                            ),
                          ),
                        ],
                      ),
                      _SectionH(text: appLoc.ingredients),
                      _bullet(theme, 'Chicken breast (150g)'),
                      _bullet(theme, 'Quinoa (90g)'),
                      _bullet(theme, 'Avocado (50g)'),
                      _bullet(theme, 'Cherry tomatoes (40g)'),
                      _bullet(theme, 'Broccoli (30g)'),
                      _bullet(theme, 'Bell peppers (25g)'),
                      _bullet(theme, 'Tahini dressing (20ml)'),
                      _bullet(theme, 'Olive oil (10ml)'),
                      _bullet(theme, 'Lemon juice, salt, pepper'),
                      _SectionH(text: appLoc.allergenInformation),
                      Row(
                        spacing: 8,
                        children: [
                          _badge(theme, appLoc.glutenFree,
                              AppTheme.emeraldLight, AppTheme.emeraldText),
                          _badge(theme, appLoc.dairyFree,
                              AppTheme.emeraldLight, AppTheme.emeraldText),
                          _badge(theme, appLoc.nutFree,
                              AppTheme.emeraldLight, AppTheme.emeraldText),
                        ],
                      ),
                      Text(
                        appLoc.mayContainTraces,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: AppTheme.caTextWarmGray,
                        ),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          _badge(theme, appLoc.nonVeg,
                              const Color(0xFFFAE0E3), const Color(0xFFB23A48)),
                          _badge(theme, 'High Protein',
                              AppTheme.emeraldLight, AppTheme.emeraldText),
                          _badge(theme, appLoc.lowCarb,
                              AppTheme.emeraldLight, AppTheme.emeraldText),
                        ],
                      ),
                      _SectionH(text: appLoc.chefsNote),
                      Row(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFFE9A23B),
                            radius: 18,
                            child: Text(
                              'CA',
                              style: TextStyle(
                                color: AppTheme.secondaryColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Text(
                                  appLoc.chefName,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.caTextPrimary,
                                  ),
                                ),
                                Text(
                                  appLoc.chefNoteText,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.darkSurfaceColor
                      : AppTheme.contentCard,
                  border: Border(
                    top: BorderSide(
                      color: isDark
                          ? AppTheme.darkBorderColor
                          : AppTheme.contentCardBorder,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: KFilledBtn(
                        onTap: () => showSwapSheet(context),
                        btnText: appLoc.swapMeal,
                      ),
                    ),
                    Expanded(
                      child: _OutlineBtn(
                        label: appLoc.customizeAction,
                        onTap: () => showCustomizeSheet(context),
                      ),
                    ),
                    Expanded(
                      child: _OutlineBtn(
                        label: appLoc.skipAction,
                        onTap: () => showSkipPopup(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(ThemeData theme, String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: fg,
        ),
      ),
    );
  }

  Widget _bullet(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 5, color: AppTheme.caTextMuted),
          ),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 13,
                color: AppTheme.caTextPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionH extends StatelessWidget {
  final String text;
  const _SectionH({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text,
        style: theme.textTheme.headlineMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppTheme.caTextPrimary,
        ),
      ),
    );
  }
}

class _NutTile extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _NutTile({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        spacing: 2,
        children: [
          Text(
            value,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppTheme.caTextPrimary,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextWarmGray,
            ),
          ),
        ],
      ),
    );
  }
}

class _OutlineBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlineBtn({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppTheme.transparentColor,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: AppTheme.contentCardBorder, width: 1),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppTheme.caTextPrimary,
          ),
        ),
      ),
    );
  }
}

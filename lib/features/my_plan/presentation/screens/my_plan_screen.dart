import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/common/widgets/k_segmented_tabs.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/home/presentation/widgets/home_meal_card.dart';
import 'package:customer_app/features/sheets/popups.dart';
import 'package:customer_app/features/sheets/rate_sheet.dart';
import 'package:customer_app/features/sheets/swap_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class MyPlanScreen extends StatefulWidget {
  const MyPlanScreen({super.key});

  @override
  State<MyPlanScreen> createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  int _tab = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: AppBar(
        title: Text(appLoc.myPlan),
        automaticallyImplyLeading: GoRouter.of(context).canPop(),
        leading: GoRouter.of(context).canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  GoRouter.of(context).pop();
                },
              )
            : null,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 14,
            children: [
              _PlanHeader(),
              _UpgradeBanner(),
              KSegmentedTabs(
                index: _tab,
                onChanged: (i) => setState(() => _tab = i),
                labels: [appLoc.day, appLoc.week, appLoc.month],
              ),
              if (_tab == 1) _WeekStrip() else const _MonthGrid(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navLabel(theme, appLoc.previous),
                  Text(
                    appLoc.monApr7,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppTheme.secondaryColor
                          : AppTheme.caTextPrimary,
                    ),
                  ),
                  _navLabel(theme, appLoc.nextLabel),
                ],
              ),
              Text(
                appLoc.caloriesTotal,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
              HomeMealCard(
                slot: '8:30 AM · Breakfast',
                name: 'Avocado Toast & Eggs',
                calMeta: '350 cal · 18g protein · 12g',
                status: appLoc.delivered,
                statusColor: AppTheme.emeraldText,
                thumbColor: const Color(0xFFEDE2D1),
                primaryActionLabel: appLoc.rate,
                onPrimaryTap: () => showRateSheet(context),
              ),
              HomeMealCard(
                slot: '12:30 PM · Lunch',
                name: 'Chicken Power Bowl',
                calMeta: '520 cal · 28g protein · 14g',
                status: appLoc.preparing,
                statusColor: const Color(0xFFB8860B),
                thumbColor: const Color(0xFFE6D5B8),
                primaryActionLabel: appLoc.track,
                onPrimaryTap: () => GoRouter.of(context)
                    .pushNamed(AppRouterConstants.deliveryTracking),
              ),
              HomeMealCard(
                slot: '7:30 PM · Dinner',
                name: 'Grilled Fish & Rice',
                calMeta: '440 cal · 32g · 16g',
                status: appLoc.upcoming,
                statusColor: AppTheme.cyanColor,
                thumbColor: const Color(0xFFD7E0E8),
                primaryActionLabel: appLoc.swap,
                secondaryActions: [appLoc.skipAction],
                onPrimaryTap: () => showSwapSheet(context),
                onSecondaryTap: (_) => showSkipPopup(context),
              ),
              _StatsRow(),
              _DietaryRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navLabel(ThemeData theme, String label) => InkWell(
        onTap: () {
          HapticFeedback.heavyImpact();
          KFeedback.show(context, label.replaceAll('→', '').replaceAll('←', '').trim());
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            label,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextSecondary,
            ),
          ),
        ),
      );
}

class _PlanHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      'Fit Pro Plan',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.emeraldLight,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        appLoc.fitProActive,
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.emeraldText,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  appLoc.planRenewsApr28,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 6,
            children: [
              _miniBtn(theme, appLoc.pause, () {}),
              _miniBtn(theme, '${appLoc.change} →', () =>
                  GoRouter.of(context).pushNamed(AppRouterConstants.mySubscription)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniBtn(ThemeData theme, String label, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Text(
        label,
        style: theme.textTheme.bodySmall!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}

class _UpgradeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4FB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFB8DDF1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Text(
            appLoc.upgradeBanner,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.caTextPrimary,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  GoRouter.of(context).pushNamed(AppRouterConstants.mySubscription);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.cyanColor,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    appLoc.viewPlans,
                    style: theme.textTheme.labelSmall!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                appLoc.save30,
                style: theme.textTheme.labelSmall!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.emeraldText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeekStrip extends StatefulWidget {
  @override
  State<_WeekStrip> createState() => _WeekStripState();
}

class _WeekStripState extends State<_WeekStrip> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dates = [7, 8, 9, 10, 11, 12, 13];
    return Row(
      children: List.generate(7, (i) {
        final selected = i == _selected;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.heavyImpact();
              setState(() => _selected = i);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: selected
                    ? AppTheme.primaryColor.withValues(alpha: 0.18)
                    : AppTheme.transparentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 2,
                children: [
                  Text(
                    days[i],
                    style: theme.textTheme.labelSmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.caTextWarmGray,
                    ),
                  ),
                  Text(
                    '${dates[i]}',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: selected
                          ? AppTheme.primaryColor
                          : AppTheme.caTextPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.contentDivider.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: 35,
        itemBuilder: (_, i) {
          final day = i - 1;
          if (day < 1 || day > 30) return const SizedBox.shrink();
          final hasMeal = [7, 8, 9, 12, 13, 14, 18].contains(day);
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: hasMeal
                  ? AppTheme.primaryColor.withValues(alpha: 0.18)
                  : AppTheme.transparentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$day',
              style: theme.textTheme.labelSmall!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.caTextPrimary,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        Text(
          appLoc.yourStats,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(child: _stat(theme, '42', appLoc.mealsEaten)),
            Expanded(child: _stat(theme, '3', appLoc.mealsSkipped)),
            Expanded(child: _stat(theme, '12', appLoc.dayStreak)),
            Expanded(child: _stat(theme, '4.6', appLoc.avgRating)),
          ],
        ),
      ],
    );
  }

  Widget _stat(ThemeData theme, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.contentCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.contentCardBorder, width: 1),
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
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 10,
              color: AppTheme.caTextWarmGray,
            ),
          ),
        ],
      ),
    );
  }
}

class _DietaryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                appLoc.dietaryPreferencesShort,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                appLoc.dietaryValues,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();
            KFeedback.show(context, 'Dietary preferences');
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              appLoc.editArrow,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

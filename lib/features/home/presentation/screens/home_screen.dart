import 'dart:async';

import 'package:customer_app/common/widgets/k_search_field.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/home/presentation/widgets/home_meal_card.dart';
import 'package:customer_app/features/home/presentation/widgets/home_skeleton.dart';
import 'package:customer_app/features/sheets/popups.dart';
import 'package:customer_app/features/sheets/rate_sheet.dart';
import 'package:customer_app/features/sheets/swap_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  Timer? _t;

  @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      body: Column(
        children: [
          _Hero(onSearchTap: () =>
              GoRouter.of(context).pushNamed(AppRouterConstants.search)),
          Expanded(
            child: _loading
                ? const HomeSkeleton()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16,
                      children: [
                        _LunchUpdate(),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: _BannerCard(
                                title: appLoc.fitMealsBanner,
                                bg: AppTheme.contentDivider,
                                fg: AppTheme.caTextPrimary,
                              ),
                            ),
                            Expanded(
                              child: _BannerCard(
                                title: appLoc.fitMealsCount,
                                bg: const Color(0xFFFFE8AF),
                                fg: const Color(0xFFB8860B),
                              ),
                            ),
                          ],
                        ),
                        _SectionRow(
                          title: appLoc.todaysMeals,
                          actionLabel: appLoc.seeAll,
                          onAction: () => GoRouter.of(context)
                              .pushNamed(AppRouterConstants.myPlan),
                        ),
                        HomeMealCard(
                          slot: '8:30 AM · Breakfast',
                          name: 'Avocado Toast & Eggs',
                          calMeta: '350 cal · 22g · 18g',
                          status: appLoc.delivered,
                          statusColor: AppTheme.emeraldText,
                          thumbColor: const Color(0xFFEDE2D1),
                          primaryActionLabel: appLoc.rate,
                          onPrimaryTap: () => showRateSheet(context),
                        ),
                        HomeMealCard(
                          slot: '12:30 PM · Lunch',
                          name: 'Chicken Power Bowl',
                          calMeta: '520 cal · 42g · 36g',
                          status: appLoc.preparing,
                          statusColor: const Color(0xFFB8860B),
                          thumbColor: const Color(0xFFE6D5B8),
                          primaryActionLabel: appLoc.swap,
                          secondaryActions: [appLoc.skipAction],
                          onPrimaryTap: () => showSwapSheet(context),
                          onSecondaryTap: (_) => showSkipPopup(context),
                        ),
                        _SectionRow(
                          title: appLoc.tomorrowsLineup,
                          actionLabel: appLoc.customize,
                          onAction: () => GoRouter.of(context)
                              .pushNamed(AppRouterConstants.myPlan),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: _LineupCard(
                                name: 'Protein Dosa',
                                color: const Color(0xFFF0E4D2),
                              ),
                            ),
                            Expanded(
                              child: _LineupCard(
                                name: 'Fish Bowl',
                                color: const Color(0xFFD7E0E8),
                              ),
                            ),
                            Expanded(
                              child: _LineupCard(
                                name: 'Chicken Tikka',
                                color: const Color(0xFFEAD2CE),
                              ),
                            ),
                          ],
                        ),
                        _SectionRow(
                          title: appLoc.yourKitchen,
                          actionLabel: appLoc.aboutArrow,
                          onAction: () => GoRouter.of(context)
                              .pushNamed(AppRouterConstants.aboutKitchen),
                        ),
                        _KitchenCard(),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  final VoidCallback onSearchTap;
  const _Hero({required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.heroGradientStart,
            AppTheme.heroGradientMid,
            AppTheme.heroGradientEnd,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Gowtham',
                          style: theme.textTheme.headlineLarge!.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.caTextOnHero,
                          ),
                        ),
                        Text(
                          'Coimbatore, TN · Home',
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            color: AppTheme.caTextOnHero,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      GoRouter.of(context)
                          .pushNamed(AppRouterConstants.notificationsScreen);
                    },
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppTheme.caTextOnHero,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      GoRouter.of(context)
                          .pushNamed(AppRouterConstants.profile);
                    },
                    icon: const Icon(
                      Icons.person_outline_rounded,
                      color: AppTheme.caTextOnHero,
                    ),
                  ),
                ],
              ),
              KSearchField(
                hintText: appLoc.searchForHint,
                readOnly: true,
                onTap: onSearchTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LunchUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;
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
        spacing: 10,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  appLoc.lunchOnTheWay,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  appLoc.riderEta,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(99),
            onTap: () {
              HapticFeedback.heavyImpact();
              GoRouter.of(context)
                  .pushNamed(AppRouterConstants.deliveryTracking);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                appLoc.track,
                style: theme.textTheme.labelSmall!.copyWith(
                  fontSize: 11,
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
}

class _BannerCard extends StatelessWidget {
  final String title;
  final Color bg;
  final Color fg;
  const _BannerCard({required this.title, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 80,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: theme.textTheme.headlineMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: fg,
        ),
      ),
    );
  }
}

class _SectionRow extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback onAction;
  const _SectionRow({
    required this.title,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: isDark
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();
            onAction();
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              actionLabel,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 13,
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

class _LineupCard extends StatelessWidget {
  final String name;
  final Color color;
  const _LineupCard({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isDark
                    ? AppTheme.secondaryColor
                    : AppTheme.caTextPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KitchenCard extends StatelessWidget {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            spacing: 12,
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'FK',
                  style: TextStyle(
                    color: AppTheme.secondaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      appLoc.kitchenAuthor,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    Text(
                      appLoc.kitchenLocationSince,
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
          Row(
            spacing: 8,
            children: [
              _miniBadge(theme, appLoc.fssaiCertified, AppTheme.emeraldLight,
                  AppTheme.emeraldText),
              _miniBadge(theme, '★ 500+ subscribers',
                  AppTheme.contentDivider, AppTheme.caTextPrimary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniBadge(ThemeData theme, String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: fg,
        ),
      ),
    );
  }
}

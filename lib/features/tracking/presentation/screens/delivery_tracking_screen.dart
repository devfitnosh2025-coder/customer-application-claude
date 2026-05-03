import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class DeliveryTrackingScreen extends StatelessWidget {
  const DeliveryTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(
        actions: [
          TextButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              KFeedback.show(context, 'ETA shared');
            },
            child: Text(
              appLoc.shareEta,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _MapPlaceholder(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 14,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.darkSurfaceColor
                            : AppTheme.contentCard,
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
                            children: [
                              Expanded(
                                child: Text(
                                  appLoc.powerBowlOnMove,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: isDark
                                        ? AppTheme.secondaryColor
                                        : AppTheme.caTextPrimary,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB23A48),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Text(
                                  appLoc.liveBadge,
                                  style: theme.textTheme.labelSmall!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            appLoc.caloriesProteinShort,
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: AppTheme.caTextWarmGray,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _step(theme, appLoc.preparedCookingPickedUp, true),
                              _step(theme, appLoc.cooking, true),
                              _step(theme, appLoc.pickedUp, true),
                              _step(theme, appLoc.onTheWay, true, active: true),
                              _step(theme, appLoc.arrived, false),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.darkSurfaceColor
                            : AppTheme.contentCard,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark
                              ? AppTheme.darkBorderColor
                              : AppTheme.contentCardBorder,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: AppTheme.primaryColor,
                            child: Text(
                              'K',
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
                                  'Karthik',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isDark
                                        ? AppTheme.secondaryColor
                                        : AppTheme.caTextPrimary,
                                  ),
                                ),
                                Text(
                                  'Honda Activa · 4.9 · 2.3 ${appLoc.kmAway}',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: AppTheme.caTextWarmGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              HapticFeedback.heavyImpact();
                              KFeedback.show(context, 'Calling Karthik…');
                            },
                            icon: const Icon(
                              Icons.call_rounded,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              HapticFeedback.heavyImpact();
                              GoRouter.of(context).pushNamed(
                                AppRouterConstants.messageRider,
                              );
                            },
                            icon: const Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      appLoc.todaysDeliveries,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    _delivery(theme, 'Avocado Toast', '8:30 AM',
                        appLoc.delivered, AppTheme.emeraldText),
                    _delivery(theme, 'Chicken Power Bowl', '12:30 PM',
                        appLoc.onTheWay, AppTheme.cyanColor, dot: true),
                    _delivery(theme, 'Grilled Fish & Rice', '7:30 PM',
                        appLoc.upcoming, AppTheme.caTextMuted),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          HapticFeedback.heavyImpact();
                          GoRouter.of(context)
                              .pushNamed(AppRouterConstants.helpSupport);
                        },
                        child: Text(
                          appLoc.reportIssue,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFB23A48),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _step(ThemeData theme, String label, bool done, {bool active = false}) {
    final color = active
        ? AppTheme.primaryColor
        : (done ? AppTheme.emeraldText : AppTheme.caTextMuted);
    return Column(
      spacing: 4,
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(
          width: 56,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _delivery(
    ThemeData theme,
    String name,
    String time,
    String status,
    Color color, {
    bool dot = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          if (dot)
            Container(
              height: 8,
              width: 8,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
              ),
            )
          else
            const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            time,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppTheme.caTextWarmGray,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            status,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE8F0DC),
            Color(0xFFD8E5C5),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A2A1A),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              '12 ${appLoc.minAway}',
              style: const TextStyle(
                color: AppTheme.secondaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
          const Positioned(
            top: 20,
            right: 20,
            child: Icon(Icons.home_rounded, color: Color(0xFFB23A48)),
          ),
          const Positioned(
            bottom: 30,
            left: 30,
            child: Icon(Icons.delivery_dining_rounded, color: AppTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}

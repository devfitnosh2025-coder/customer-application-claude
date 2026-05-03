import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
        title: appLoc.notifications,
        actions: [
          TextButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              KFeedback.show(context, 'All notifications marked as read');
            },
            child: Text(
              appLoc.markAllRead,
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
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(text: appLoc.today),
              _Item(
                icon: Icons.delivery_dining_rounded,
                color: AppTheme.primaryColor,
                title: appLoc.lunchOnTheWayShort,
                desc: appLoc.lunchOnTheWayDesc,
                unread: true,
              ),
              _Item(
                icon: Icons.star_rounded,
                color: const Color(0xFFB8860B),
                title: appLoc.rateBreakfast,
                desc: appLoc.rateBreakfastDesc,
              ),
              _Item(
                icon: Icons.refresh_rounded,
                color: AppTheme.cyanColor,
                title: appLoc.planRenewingSoon,
                desc: appLoc.planRenewingDesc,
              ),
              _Header(text: appLoc.earlier),
              _Item(
                icon: Icons.check_circle_rounded,
                color: AppTheme.emeraldText,
                title: appLoc.mealDelivered,
                desc: appLoc.mealDeliveredDesc,
              ),
              _Item(
                icon: Icons.swap_horiz_rounded,
                color: AppTheme.cyanColor,
                title: appLoc.mealSwapped,
                desc: appLoc.mealSwappedDesc,
              ),
              _Item(
                icon: Icons.fiber_new_rounded,
                color: AppTheme.macroProtein,
                title: appLoc.newMenuItems,
                desc: appLoc.newMenuItemsDesc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  const _Header({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Text(
        text,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: AppTheme.caTextSecondary,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  final bool unread;
  const _Item({
    required this.icon,
    required this.color,
    required this.title,
    required this.desc,
    this.unread = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: unread
            ? color.withValues(alpha: 0.08)
            : (isDark
                ? AppTheme.darkSurfaceColor
                : AppTheme.contentCard),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  desc,
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
    );
  }
}

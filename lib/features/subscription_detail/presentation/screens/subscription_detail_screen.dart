import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/sheets/pause_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SubscriptionDetailScreen extends StatelessWidget {
  const SubscriptionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.mySubscriptionTitle),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              _PlanCard(),
              _SectionTitle(text: appLoc.billingCycle),
              _Row(label: appLoc.startDate, value: appLoc.startDateValue),
              _Row(label: appLoc.endDate, value: appLoc.endDateValue),
              _Row(label: appLoc.nextRenewal, value: appLoc.nextRenewalValue),
              _Row(label: appLoc.amount, value: appLoc.amountValue),
              _SectionTitle(text: appLoc.paymentMethod),
              _Row(label: 'UPI — PhonePe', value: '${appLoc.change} →'),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.contentDivider,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  appLoc.autoRenewLine,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: _OutlineBtn(
                      label: appLoc.pausePlan,
                      onTap: () => showPauseSheet(context),
                      color: const Color(0xFFB8860B),
                      bg: const Color(0xFFFFF4D6),
                    ),
                  ),
                  Expanded(
                    child: KFilledBtn(
                      onTap: () => GoRouter.of(context)
                          .pushNamed(AppRouterConstants.plans),
                      btnText: appLoc.changePlan,
                    ),
                  ),
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  child: Text(
                    appLoc.cancelSubscription,
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
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
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
        spacing: 8,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Fit Pro Plan',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontSize: 18,
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
                  color: AppTheme.emeraldLight,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  appLoc.active,
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
            '₹2,499/month',
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextSecondary,
            ),
          ),
          Text(
            appLoc.mealsPerWeekDay,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppTheme.caTextWarmGray,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: 18 / 28,
                    minHeight: 8,
                    backgroundColor: AppTheme.contentDivider,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                appLoc.remainingDays,
                style: theme.textTheme.labelSmall!.copyWith(
                  fontSize: 11,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
            ],
          ),
          Text(
            appLoc.mealsConsumed,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppTheme.caTextWarmGray,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.headlineMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppTheme.caTextPrimary,
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 13,
                color: AppTheme.caTextWarmGray,
              ),
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextPrimary,
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
  final Color color;
  final Color bg;
  const _OutlineBtn({
    required this.label,
    required this.onTap,
    required this.color,
    required this.bg,
  });

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
          color: bg,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ),
    );
  }
}

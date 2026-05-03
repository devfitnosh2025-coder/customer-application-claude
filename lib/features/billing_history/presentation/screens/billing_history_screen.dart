import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BillingHistoryScreen extends StatelessWidget {
  const BillingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.billingHistory),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              _ThisMonthCard(),
              _SectionHeader(label: appLoc.subscriptionInvoices),
              _InvoiceRow(plan: 'Fit Pro Plan — Monthly', date: 'Mar 28, 2026', code: 'INV-2026-0328', amount: '₹2,499'),
              _InvoiceRow(plan: 'Fit Pro Plan — Monthly', date: 'Feb 28, 2026', code: 'INV-2026-0228', amount: '₹2,499'),
              _InvoiceRow(plan: 'Fit Pro Plan — Monthly', date: 'Jan 28, 2026', code: 'INV-2026-0128', amount: '₹2,499'),
              _InvoiceRow(plan: 'Lite Plan — Monthly', date: 'Dec 28, 2025', code: 'INV-2025-1228', amount: '₹999'),
              _InvoiceRow(plan: 'Lite Plan — Monthly', date: 'Nov 28, 2025', code: 'INV-2025-1128', amount: '₹999'),
              _SectionHeader(label: appLoc.onDemandOrders),
              _InvoiceRow(plan: 'On-Demand: Chicken Power Bowl', date: 'Apr 5, 2026', code: 'ORD-2026-0405', amount: '₹299', showPdf: false),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThisMonthCard extends StatelessWidget {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Text(
                  appLoc.thisMonth,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
                Text(
                  '₹2,499',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Text(
                appLoc.nextChargeAutoRenew,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: AppTheme.caTextWarmGray,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Text(
      label,
      style: theme.textTheme.headlineMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: isDark ? AppTheme.secondaryColor : AppTheme.caTextPrimary,
      ),
    );
  }
}

class _InvoiceRow extends StatelessWidget {
  final String plan;
  final String date;
  final String code;
  final String amount;
  final bool showPdf;

  const _InvoiceRow({
    required this.plan,
    required this.date,
    required this.code,
    required this.amount,
    this.showPdf = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  plan,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  '$date · $code',
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
            spacing: 4,
            children: [
              Text(
                amount,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              Row(
                spacing: 6,
                children: [
                  if (showPdf)
                    Text(
                      appLoc.pdf,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
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
                      appLoc.paid,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.emeraldText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

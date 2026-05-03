import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/plans/presentation/widgets/plan_card.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.chooseYourPlan),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.darkSurfaceColor
                      : AppTheme.contentCard,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? AppTheme.darkBorderColor
                        : AppTheme.contentCardBorder,
                    width: 1,
                  ),
                ),
                child: Text(
                  appLoc.currentPlanLabel,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 13,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
              ),
              PlanCard(
                name: appLoc.planLite,
                price: appLoc.priceLite,
                subtitle: appLoc.liteSubtitle,
                description: appLoc.liteDesc,
                ctaState: PlanCtaState.downgrade,
                onTap: () => KFeedback.show(context, 'Downgrade to Lite scheduled'),
              ),
              const SizedBox(height: 4),
              PlanCard(
                name: appLoc.planPro,
                price: appLoc.pricePro,
                subtitle: appLoc.proSubtitle,
                description: appLoc.proDesc,
                ctaState: PlanCtaState.current,
                highlight: true,
                onTap: () => KFeedback.show(context, 'You\'re on the Pro plan'),
              ),
              PlanCard(
                name: appLoc.planElite,
                price: appLoc.priceElite,
                subtitle: appLoc.eliteSubtitle,
                description: appLoc.eliteDesc,
                ctaState: PlanCtaState.upgrade,
                onTap: () => KFeedback.show(context, 'Upgrading to Elite…'),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  appLoc.compareAllFeatures,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              Text(
                appLoc.featureComparison,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              _FeatureTable(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    final headerStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: isDark ? AppTheme.secondaryColor : AppTheme.caTextPrimary,
    );
    final cellStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 13,
      color: AppTheme.caTextSecondary,
    );

    TableRow row(List<String> cells, {bool isHeader = false}) => TableRow(
          children: cells
              .map(
                (c) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 4,
                  ),
                  child: Text(c, style: isHeader ? headerStyle : cellStyle),
                ),
              )
              .toList(),
        );

    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: isDark ? AppTheme.darkBorderColor : AppTheme.contentDivider,
          width: 1,
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(2.2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        row([
          appLoc.featureColumn,
          appLoc.planLite,
          appLoc.planPro,
          appLoc.planElite,
        ], isHeader: true),
        row([appLoc.mealsPerDay, '1', '2', '3']),
        row([appLoc.mealTypes, 'L', 'B+L', 'B+L+D']),
        row([appLoc.portionSize, 'Standard', 'Standard', 'Large']),
        row([appLoc.addOns, 'Paid', 'Free', 'Free']),
      ],
    );
  }
}

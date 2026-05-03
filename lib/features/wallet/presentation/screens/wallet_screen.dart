import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _autoApply = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.walletCredits),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              _BalanceCard(
                onTopUp: () => KFeedback.show(context, 'Top up flow coming soon'),
              ),
              Text(
                appLoc.creditsRewards,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              _CreditRow(label: 'Referral bonus', date: 'Apr 3, 2026', amount: '+₹200', positive: true),
              _CreditRow(label: 'Cashback — Pro upgrade', date: 'Mar 28, 2026', amount: '+₹150', positive: true),
              _CreditRow(label: 'Used for order #1247', date: 'Mar 25, 2026', amount: '-₹100', positive: false),
              _CreditRow(label: 'Welcome credit', date: 'Mar 15, 2026', amount: '+₹100', positive: true),
              _CreditRow(label: 'Used for order #1189', date: 'Mar 10, 2026', amount: '-₹50', positive: false),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          Text(
                            appLoc.autoApplyWallet,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: isDark
                                  ? AppTheme.secondaryColor
                                  : AppTheme.caTextPrimary,
                            ),
                          ),
                          Text(
                            appLoc.autoApplyDesc,
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: AppTheme.caTextWarmGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch.adaptive(
                      value: _autoApply,
                      activeThumbColor: AppTheme.primaryColor,
                      onChanged: (v) {
                        HapticFeedback.heavyImpact();
                        setState(() => _autoApply = v);
                      },
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
}

class _BalanceCard extends StatelessWidget {
  final VoidCallback onTopUp;
  const _BalanceCard({required this.onTopUp});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.heroGradientStart,
            AppTheme.heroGradientMid,
            AppTheme.heroGradientEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Text(
                  appLoc.availableBalance,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 13,
                    color: AppTheme.caTextOnHero,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '₹450',
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.caTextOnHero,
                      ),
                    ),
                    Text(
                      '.00',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.caTextOnHero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(99),
            onTap: () {
              HapticFeedback.heavyImpact();
              onTopUp();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '+ ${appLoc.topUp}',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.caTextOnHero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreditRow extends StatelessWidget {
  final String label;
  final String date;
  final String amount;
  final bool positive;

  const _CreditRow({
    required this.label,
    required this.date,
    required this.amount,
    required this.positive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  date,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: positive ? AppTheme.emeraldText : const Color(0xFFB23A48),
            ),
          ),
        ],
      ),
    );
  }
}

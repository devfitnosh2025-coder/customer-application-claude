import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.referEarn),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 18,
            children: [
              _GiveGetCard(),
              _CodeRow(code: 'GOWTHAM200'),
              Text(
                appLoc.shareVia,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ShareIcon(label: appLoc.whatsapp, color: const Color(0xFF25D366), letter: 'W'),
                  _ShareIcon(label: appLoc.sms, color: const Color(0xFFE9A23B), letter: 'S'),
                  _ShareIcon(label: appLoc.email, color: const Color(0xFF6E7B8B), letter: 'E'),
                  _ShareIcon(label: appLoc.more, color: AppTheme.caTextSecondary, letter: '+'),
                ],
              ),
              Text(
                appLoc.yourReferralStats,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: _StatTile(value: '5', label: appLoc.invited)),
                  Expanded(child: _StatTile(value: '3', label: appLoc.subscribed)),
                  Expanded(child: _StatTile(value: '₹600', label: appLoc.earned)),
                ],
              ),
              Text(
                appLoc.recentReferrals,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              _ReferralEntry(name: 'Aadhav', status: appLoc.subscribed, amount: '+₹200 earned', success: true),
              _ReferralEntry(name: 'Imran', status: appLoc.subscribed, amount: '+₹200 earned', success: true),
              _ReferralEntry(name: 'Priya', status: appLoc.subscribed, amount: '+₹200 earned', success: true),
              _ReferralEntry(name: 'Ravi', status: appLoc.invited, amount: appLoc.pending, success: false),
              _ReferralEntry(name: 'Sneha', status: appLoc.invited, amount: appLoc.pending, success: false),
            ],
          ),
        ),
      ),
    );
  }
}

class _GiveGetCard extends StatelessWidget {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            appLoc.giveGetTitle,
            style: theme.textTheme.headlineLarge!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppTheme.caTextOnHero,
            ),
          ),
          Text(
            appLoc.giveGetDesc,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 13,
              color: AppTheme.caTextOnHero,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            appLoc.unlimitedNoExpiry,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextOnHero,
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeRow extends StatelessWidget {
  final String code;
  const _CodeRow({required this.code});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(8),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
            child: Text(
              appLoc.yourReferralCode,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: AppTheme.caTextWarmGray,
              ),
            ),
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    code,
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      color: isDark
                          ? AppTheme.secondaryColor
                          : AppTheme.caTextPrimary,
                    ),
                  ),
                ),
              ),
              _pillButton(theme, appLoc.copy, () {}),
              _pillButton(theme, appLoc.share, () {}, primary: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pillButton(ThemeData theme, String label, VoidCallback onTap,
      {bool primary = false}) {
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: primary ? AppTheme.primaryColor : AppTheme.transparentColor,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: primary ? AppTheme.primaryColor : AppTheme.contentCardBorder,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: primary ? AppTheme.secondaryColor : AppTheme.caTextPrimary,
          ),
        ),
      ),
    );
  }
}

class _ShareIcon extends StatelessWidget {
  final String label;
  final Color color;
  final String letter;
  const _ShareIcon({required this.label, required this.color, required this.letter});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 6,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(
            letter,
            style: const TextStyle(
              color: AppTheme.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 11,
            color: AppTheme.caTextWarmGray,
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String value;
  final String label;
  const _StatTile({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
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
      child: Column(
        spacing: 4,
        children: [
          Text(
            value,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: isDark
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
          Text(
            label,
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

class _ReferralEntry extends StatelessWidget {
  final String name;
  final String status;
  final String amount;
  final bool success;
  const _ReferralEntry({
    required this.name,
    required this.status,
    required this.amount,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        spacing: 12,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: success
                  ? AppTheme.emeraldLight
                  : AppTheme.contentDivider,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              name[0],
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: success
                    ? AppTheme.emeraldText
                    : AppTheme.caTextSecondary,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  name,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  '$status · $amount',
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

import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/payment_methods/presentation/widgets/payment_row.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.paymentMethods),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PaymentSectionHeader(label: appLoc.upi),
              PaymentRow(
                leading: _circle(const Color(0xFF5F66E5), 'P'),
                title: 'PhonePe',
                subtitle: 'gowtham@ybl',
                trailing: _badge(theme, appLoc.defaultText, true),
                onTap: () => KFeedback.show(context, 'PhonePe is your default'),
              ),
              PaymentRow(
                leading: _circle(const Color(0xFF6E7B8B), 'G'),
                title: 'Google Pay',
                subtitle: 'gowtham@okicici',
                trailing: _badge(theme, appLoc.setDefault, false),
                onTap: () => KFeedback.show(context, 'Google Pay set as default'),
              ),
              PaymentSectionHeader(label: appLoc.cards),
              PaymentRow(
                leading: Container(
                  height: 36,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9C97A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'VISA',
                    style: theme.textTheme.labelSmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.caTextPrimary,
                    ),
                  ),
                ),
                title: 'HDFC Visa ****6411',
                subtitle: 'Expires 08/28',
                trailing: const Icon(
                  Icons.more_horiz,
                  color: AppTheme.caTextMuted,
                ),
                onTap: () => KFeedback.show(context, 'Card options'),
              ),
              PaymentSectionHeader(label: appLoc.wallet),
              PaymentRow(
                leading: _circle(AppTheme.emeraldLight, '₹',
                    fg: AppTheme.emeraldText),
                title: appLoc.kitchenOsWallet,
                subtitle: appLoc.walletBalance,
                trailing: Text(
                  appLoc.topUp,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryColor,
                  ),
                ),
                onTap: () => KFeedback.show(context, 'Top up wallet'),
              ),
              const SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(99),
                onTap: () {
                  HapticFeedback.heavyImpact();
                  KFeedback.show(context, 'Add payment method coming soon');
                },
                child: Container(
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.transparentColor,
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                      color: AppTheme.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    appLoc.addPaymentMethod,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
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

  Widget _circle(Color bg, String letter, {Color fg = Colors.white}) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        letter,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w800,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _badge(ThemeData theme, String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: active ? AppTheme.emeraldLight : AppTheme.transparentColor,
        borderRadius: BorderRadius.circular(99),
        border: active
            ? null
            : Border.all(color: AppTheme.contentCardBorder, width: 1),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: active ? AppTheme.emeraldText : AppTheme.caTextSecondary,
        ),
      ),
    );
  }
}

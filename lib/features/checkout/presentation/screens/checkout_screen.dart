import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/sheets/address_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _slot = 'asap';
  final TextEditingController _ins = TextEditingController();

  @override
  void dispose() {
    _ins.dispose();
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
      appBar: KAppBar(title: appLoc.checkout),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              _SectionTitle(text: appLoc.deliverTo),
              _Card(
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 18,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          Text(
                            'Home — 12, Gandhi Nagar, Gandhipuram',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '25–30 min delivery',
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
                        showAddressSheet(context);
                      },
                      child: Text(
                        appLoc.change,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _SectionTitle(text: appLoc.deliveryTime),
              Wrap(
                spacing: 8,
                children: [
                  _slotChip('asap', appLoc.asap),
                  _slotChip('1230', '12:30 PM'),
                  _slotChip('100', '1:00 PM'),
                  _slotChip('130', '1:30 PM'),
                ],
              ),
              Text(
                appLoc.onDemandOnly,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
              _SectionTitle(text: appLoc.deliveryInstructions),
              TextField(
                controller: _ins,
                style: theme.textTheme.bodyLarge,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: appLoc.instructionHint,
                  hintStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: AppTheme.caTextMuted,
                  ),
                  filled: true,
                  fillColor: AppTheme.contentCard,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppTheme.contentCardBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppTheme.contentCardBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppTheme.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              _SectionTitle(text: appLoc.payment),
              _Card(
                child: Row(
                  spacing: 12,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFF5F66E5),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'P',
                        style: TextStyle(
                          color: AppTheme.secondaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'PhonePe',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        GoRouter.of(context)
                            .pushNamed(AppRouterConstants.paymentMethods);
                      },
                      child: Text(
                        '${appLoc.change} →',
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _SectionTitle(text: appLoc.orderSummary),
              Text(
                appLoc.orderSummaryLine,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 13,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      appLoc.total,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    '₹503.40',
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.caTextPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              KFilledBtn(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  GoRouter.of(context).pop();
                  KFeedback.show(context, 'Order placed · ₹503.40');
                },
                btnText: '${appLoc.placeOrder} · ₹503.40',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _slotChip(String key, String label) {
    final theme = Theme.of(context);
    final selected = _slot == key;
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        setState(() => _slot = key);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryColor.withValues(alpha: 0.15)
              : AppTheme.contentCard,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: selected
                ? AppTheme.primaryColor
                : AppTheme.contentCardBorder,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: selected
                ? AppTheme.primaryColor
                : AppTheme.caTextPrimary,
          ),
        ),
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

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
      child: child,
    );
  }
}

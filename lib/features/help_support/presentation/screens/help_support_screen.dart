import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/common/widgets/k_search_field.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.helpSupport),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Text(
                appLoc.howCanWeHelp,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              KSearchField(hintText: appLoc.searchHelpHint),
              Text(
                appLoc.quickContact,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.caTextPrimary,
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: _ContactCard(
                      icon: Icons.call_rounded,
                      label: appLoc.callSupport,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: _ContactCard(
                      icon: Icons.chat_bubble_outline_rounded,
                      label: appLoc.chatWithUsShort,
                      color: AppTheme.cyanColor,
                    ),
                  ),
                  Expanded(
                    child: _ContactCard(
                      icon: Icons.email_outlined,
                      label: appLoc.emailUs,
                      color: AppTheme.macroProtein,
                    ),
                  ),
                ],
              ),
              Text(
                appLoc.faq,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.caTextPrimary,
                ),
              ),
              _GroupHeader(text: appLoc.orders),
              _Faq(question: appLoc.faq1),
              _Faq(question: appLoc.faq2),
              _Faq(question: appLoc.faq3),
              _GroupHeader(text: appLoc.subscriptionCaps),
              _Faq(question: appLoc.faq4),
              _Faq(question: appLoc.faq5),
              _Faq(question: appLoc.faq6),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: KFilledBtn(
                  onTap: () => KFeedback.show(context, 'Ticket raised — we\'ll be in touch'),
                  btnText: appLoc.raiseTicket,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    KFeedback.show(context, 'Callback requested');
                  },
                  child: Text(
                    appLoc.requestCallback,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 13,
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
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ContactCard({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        HapticFeedback.heavyImpact();
        KFeedback.show(context, '$label opened');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
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
          spacing: 6,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.caTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final String text;
  const _GroupHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          color: AppTheme.caTextSecondary,
        ),
      ),
    );
  }
}

class _Faq extends StatefulWidget {
  final String question;
  const _Faq({required this.question});

  @override
  State<_Faq> createState() => _FaqState();
}

class _FaqState extends State<_Faq> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Material(
        color: AppTheme.transparentColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            HapticFeedback.heavyImpact();
            setState(() => _expanded = !_expanded);
          },
          child: AnimatedSize(
            duration: const Duration(milliseconds: 180),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.question,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppTheme.secondaryColor
                                : AppTheme.caTextPrimary,
                          ),
                        ),
                      ),
                      Icon(
                        _expanded ? Icons.remove : Icons.add,
                        size: 18,
                        color: AppTheme.caTextMuted,
                      ),
                    ],
                  ),
                  if (_expanded)
                    Text(
                      'Tap the meal in My Plan, then choose Swap or Skip before the cutoff time. Changes apply only to upcoming meals.',
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: AppTheme.caTextWarmGray,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

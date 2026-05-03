import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    const digits = ['4', '2', '8', '|', '', ''];

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: const KAppBar(),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: AppTheme.emeraldLight,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.check_rounded,
                    color: AppTheme.emeraldText,
                    size: 32,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                appLoc.verifyYourNumber,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${appLoc.enterCodeSentTo}\n+91 98765 XXXXX',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: TextButton(
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    appLoc.changeNumber,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: List.generate(6, (i) {
                  return Container(
                    height: 56,
                    width: 44,
                    alignment: Alignment.center,
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
                      digits[i],
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  appLoc.resendCodeIn,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextMuted,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              KFilledBtn(
                onTap: () =>
                    GoRouter.of(context).goNamed(AppRouterConstants.signUp),
                btnText: appLoc.verifyContinue,
              ),
              const SizedBox(height: 12),
              Text(
                appLoc.didntReceiveCode,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: AppTheme.caTextMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

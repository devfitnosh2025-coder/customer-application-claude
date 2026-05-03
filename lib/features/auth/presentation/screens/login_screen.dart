import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneCtrl =
      TextEditingController(text: '98765 43210');

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.heroGradientStart,
                  AppTheme.heroGradientMid,
                  AppTheme.heroGradientEnd,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 28),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'K',
                    style: theme.textTheme.headlineLarge!.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  appLoc.appTitle,
                  style: theme.textTheme.headlineLarge!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.caTextOnHero,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  appLoc.splashTagline,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 13,
                    color: AppTheme.caTextOnHero,
                  ),
                ),
                const SizedBox(height: 28),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppTheme.darkSurfaceColor
                          : AppTheme.contentCard,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 14,
                        children: [
                          Text(
                            appLoc.welcomeBack,
                            style: theme.textTheme.headlineLarge!.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: isDark
                                  ? AppTheme.secondaryColor
                                  : AppTheme.caTextPrimary,
                            ),
                          ),
                          Text(
                            appLoc.enterPhonePrompt,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 13,
                              color: AppTheme.caTextWarmGray,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            appLoc.phoneNumber,
                            style: theme.textTheme.labelSmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.caTextSecondary,
                            ),
                          ),
                          _PhoneInput(controller: _phoneCtrl),
                          const SizedBox(height: 4),
                          KFilledBtn(
                            onTap: () => GoRouter.of(context)
                                .pushNamed(AppRouterConstants.otp),
                            btnText: appLoc.getOtp,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppTheme.contentCardBorder,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  appLoc.orContinueWith,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: AppTheme.caTextMuted,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppTheme.contentCardBorder,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            children: [
                              Expanded(
                                child: _SocialBtn(
                                  label: appLoc.google,
                                  letter: 'G',
                                  letterColor: const Color(0xFFEA4335),
                                  onTap: () => GoRouter.of(context)
                                      .pushNamed(AppRouterConstants.signUp),
                                ),
                              ),
                              Expanded(
                                child: _SocialBtn(
                                  label: appLoc.apple,
                                  letter: '',
                                  icon: Icons.apple,
                                  letterColor: AppTheme.caTextPrimary,
                                  onTap: () => GoRouter.of(context)
                                      .pushNamed(AppRouterConstants.signUp),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            appLoc.termsPrefix,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  final TextEditingController controller;
  const _PhoneInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
      child: Row(
        children: [
          Text(
            '+91',
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isDark
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                isDense: true,
              ),
            ),
          ),
          Text(
            '🇮🇳',
            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String label;
  final String letter;
  final IconData? icon;
  final Color letterColor;
  final VoidCallback onTap;

  const _SocialBtn({
    required this.label,
    required this.letter,
    required this.letterColor,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.transparentColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.contentCardBorder,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            if (icon != null)
              Icon(icon, size: 18, color: letterColor)
            else
              Text(
                letter,
                style: TextStyle(
                  color: letterColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            Text(
              label,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
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

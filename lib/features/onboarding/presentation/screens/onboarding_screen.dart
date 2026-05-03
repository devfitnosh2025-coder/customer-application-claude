import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pc = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  void _toLogin() => GoRouter.of(context).goNamed(AppRouterConstants.login);

  void _next() {
    if (_index < 2) {
      _pc.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    } else {
      _toLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    final pages = [
      _OnbPage(
        title: appLoc.onb1Title,
        sub: appLoc.onb1Sub,
        accent: AppTheme.heroGradientMid,
      ),
      _OnbPage(
        title: appLoc.onb2Title,
        sub: appLoc.onb2Sub,
        accent: AppTheme.macroProtein,
      ),
      _OnbPage(
        title: appLoc.onb3Title,
        sub: appLoc.onb3Sub,
        accent: AppTheme.macroCarbs,
      ),
    ];

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      HapticFeedback.heavyImpact();
                      _toLogin();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        appLoc.skip,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.caTextSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pc,
                onPageChanged: (i) => setState(() => _index = i),
                children: pages,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: List.generate(3, (i) {
                final selected = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 6,
                  width: selected ? 24 : 6,
                  decoration: BoxDecoration(
                    color: selected
                        ? AppTheme.primaryColor
                        : AppTheme.contentCardBorder,
                    borderRadius: BorderRadius.circular(99),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                spacing: 14,
                children: [
                  KFilledBtn(
                    onTap: _next,
                    btnText: _index < 2 ? appLoc.next : appLoc.getStarted,
                  ),
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: AppTheme.caTextSecondary,
                      ),
                      children: [
                        TextSpan(text: appLoc.alreadyHaveAccount),
                        TextSpan(
                          text: appLoc.signIn,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnbPage extends StatelessWidget {
  final String title;
  final String sub;
  final Color accent;
  const _OnbPage({required this.title, required this.sub, required this.accent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32,
        children: [
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.restaurant_rounded,
                  color: accent,
                  size: 38,
                ),
              ),
            ),
          ),
          Column(
            spacing: 10,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              Text(
                sub,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

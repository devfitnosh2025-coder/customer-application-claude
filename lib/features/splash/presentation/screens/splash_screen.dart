import 'dart:async';

import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      GoRouter.of(context).goNamed(AppRouterConstants.onboarding);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
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
        child: Stack(
          children: [
            Positioned(
              top: -60,
              right: -40,
              child: _circleBlob(180, AppTheme.secondaryColor.withValues(alpha: 0.15)),
            ),
            Positioned(
              bottom: -40,
              left: -40,
              child: _circleBlob(140, AppTheme.secondaryColor.withValues(alpha: 0.12)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 14,
                children: [
                  Container(
                    height: 88,
                    width: 88,
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'K',
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 42,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    appLoc.appTitle,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.caTextOnHero,
                    ),
                  ),
                  Text(
                    appLoc.splashTagline,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: AppTheme.caTextOnHero,
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

  Widget _circleBlob(double size, Color color) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

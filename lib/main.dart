import 'package:customer_app/core/di/service_locator.dart';
import 'package:customer_app/core/router/app_router.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:customer_app/providers/app_bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const KitchenOSApp());
}

class KitchenOSApp extends StatelessWidget {
  const KitchenOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp.router(
      title: 'Kitchen OS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );

    if (appBlocProviders.isEmpty) return app;
    return MultiBlocProvider(
      providers: appBlocProviders,
      child: app,
    );
  }
}

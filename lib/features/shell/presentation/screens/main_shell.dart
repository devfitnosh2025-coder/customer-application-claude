import 'package:customer_app/common/widgets/k_bottom_nav.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/home/presentation/screens/home_screen.dart';
import 'package:customer_app/features/my_plan/presentation/screens/my_plan_screen.dart';
import 'package:customer_app/features/order_now/presentation/screens/order_now_screen.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainShell extends StatefulWidget {
  final int initialIndex;
  const MainShell({super.key, this.initialIndex = 0});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _index = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      body: IndexedStack(
        index: _index,
        children: const [
          HomeScreen(),
          MyPlanScreen(),
          OrderNowScreen(),
        ],
      ),
      bottomNavigationBar: KBottomNav(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          KBottomNavItem(icon: Icons.home_rounded, label: appLoc.navHome),
          KBottomNavItem(
              icon: Icons.calendar_month_rounded, label: appLoc.navMyPlan),
          KBottomNavItem(
              icon: Icons.shopping_bag_rounded, label: appLoc.navOrder),
        ],
      ),
    );
  }
}

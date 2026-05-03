import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/my_orders/presentation/widgets/order_list_tile.dart';
import 'package:customer_app/features/sheets/rate_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.myOrders),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: _SegmentedTabs(
                index: _tab,
                onChanged: (i) {
                  HapticFeedback.heavyImpact();
                  setState(() => _tab = i);
                },
                left: appLoc.subscription,
                right: '${appLoc.onDemand} (3)',
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _DateHeader(label: 'Apr 7, 2026 · ${appLoc.today}'),
                    OrderListTile(
                      name: 'Avocado Toast & Eggs',
                      time: '8:30 AM',
                      calories: '350 cal',
                      isDelivered: true,
                      thumbColor: const Color(0xFFEDE2D1),
                      onRateTap: () => showRateSheet(context),
                    ),
                    OrderListTile(
                      name: 'Chicken Power Bowl',
                      time: '12:30 PM',
                      calories: '520 cal',
                      isDelivered: false,
                      thumbColor: const Color(0xFFE6D5B8),
                      onRateTap: () => showRateSheet(context),
                    ),
                    _DateHeader(label: 'Apr 6, 2026 · ${appLoc.yesterday}'),
                    OrderListTile(
                      name: 'Protein Dosa',
                      time: '8:30 AM',
                      calories: '380 cal',
                      isDelivered: true,
                      thumbColor: const Color(0xFFF0E4D2),
                      onRateTap: () => showRateSheet(context),
                    ),
                    OrderListTile(
                      name: 'Fish Bowl',
                      time: '12:30 PM',
                      calories: '450 cal',
                      isDelivered: true,
                      thumbColor: const Color(0xFFD7E0E8),
                      onRateTap: () => showRateSheet(context),
                    ),
                    OrderListTile(
                      name: 'Chicken Tikka',
                      time: '7:30 PM',
                      calories: '480 cal',
                      isDelivered: true,
                      thumbColor: const Color(0xFFEAD2CE),
                      onRateTap: () => showRateSheet(context),
                    ),
                    _DateHeader(label: 'Apr 5, 2026 · Saturday'),
                    OrderListTile(
                      name: 'Paneer Tikka Bowl',
                      time: '12:30 PM',
                      calories: '480 cal',
                      isDelivered: true,
                      thumbColor: const Color(0xFFF0E4D2),
                      onRateTap: () => showRateSheet(context),
                    ),
                    OrderListTile(
                      name: 'Dal Tadka + Roti',
                      time: '7:30 PM',
                      calories: '420 cal',
                      isDelivered: true,
                      thumbColor: const Color(0xFFF1E4C8),
                      onRateTap: () => showRateSheet(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentedTabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final String left;
  final String right;

  const _SegmentedTabs({
    required this.index,
    required this.onChanged,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.contentDivider,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        children: [
          _segment(theme, left, 0),
          _segment(theme, right, 1),
        ],
      ),
    );
  }

  Widget _segment(ThemeData theme, String label, int i) {
    final selected = index == i;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected
                ? AppTheme.ringProgress
                : AppTheme.transparentColor,
            borderRadius: BorderRadius.circular(99),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: selected
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  final String label;
  const _DateHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppTheme.caTextSecondary,
        ),
      ),
    );
  }
}

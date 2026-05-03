import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/common/widgets/k_search_field.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _ctrl = TextEditingController(text: 'Protein Bowl');
  List<String> _recents = [
    'Chicken Power Bowl',
    'Berry Smoothie',
    'Paneer Tikka',
    'Quinoa Salad',
  ];

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _setQuery(String q) {
    HapticFeedback.heavyImpact();
    setState(() {
      _ctrl.text = q;
      _ctrl.selection =
          TextSelection.fromPosition(TextPosition(offset: q.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    final recents = _recents;
    final trending = [
      appLoc.highProtein,
      appLoc.ketoBowls,
      appLoc.lowCalorie,
      appLoc.newArrivals,
      appLoc.breakfastCombos,
    ];

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: const KAppBar(),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              KSearchField(
                controller: _ctrl,
                hintText: appLoc.typeToSearchHint,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      appLoc.recent,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      HapticFeedback.heavyImpact();
                      setState(() => _recents = []);
                      KFeedback.show(context, 'Recent searches cleared');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        appLoc.clearAll,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              for (final r in recents)
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _setQuery(r),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      spacing: 10,
                      children: [
                        const Icon(Icons.history,
                            size: 16, color: AppTheme.caTextMuted),
                        Text(
                          r,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            color: isDark
                                ? AppTheme.secondaryColor
                                : AppTheme.caTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                appLoc.trendingNow,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final t in trending)
                    InkWell(
                      borderRadius: BorderRadius.circular(99),
                      onTap: () => _setQuery(t),
                      child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.contentDivider,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        t,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.caTextPrimary,
                        ),
                      ),
                    ),
                    ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  appLoc.tryVoiceSearch,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextMuted,
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

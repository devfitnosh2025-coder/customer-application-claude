import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_search_field.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/sheets/customize_sheet.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({super.key});

  @override
  State<OrderNowScreen> createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen> {
  int _category = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    final cats = [
      appLoc.bestsellers,
      appLoc.meals,
      appLoc.bowls,
      appLoc.snacks,
      appLoc.drinks,
      appLoc.under300,
    ];

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: const KAppBar(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 14,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Text(
                          appLoc.fitKitchenTitle,
                          style: theme.textTheme.headlineLarge!.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isDark
                                ? AppTheme.secondaryColor
                                : AppTheme.caTextPrimary,
                          ),
                        ),
                        Text(
                          appLoc.deliveryIn25Min,
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            color: AppTheme.caTextWarmGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.emeraldLight,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      appLoc.vegBadge,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.emeraldText,
                      ),
                    ),
                  ),
                ],
              ),
              KSearchField(hintText: appLoc.searchDishes),
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (_, i) {
                    final selected = i == _category;
                    return GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        setState(() => _category = i);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? AppTheme.ringProgress
                              : AppTheme.contentCard,
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(
                            color: selected
                                ? AppTheme.ringProgress
                                : AppTheme.contentCardBorder,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          cats[i],
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: selected
                                ? AppTheme.secondaryColor
                                : AppTheme.caTextPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      appLoc.bestsellers,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                  ),
                  Text(
                    appLoc.mostOrderedThisWeek,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: AppTheme.caTextWarmGray,
                    ),
                  ),
                ],
              ),
              _DishTile(
                tag: appLoc.bestsellers,
                tagColor: AppTheme.macroProtein,
                name: 'Chicken Power Bowl',
                desc: 'Grilled chicken, quinoa, avocado, tahini',
                price: '₹299',
                cal: '520 cal · 42g protein',
                color: const Color(0xFFE6D5B8),
                onAdd: () => GoRouter.of(context).pushNamed(AppRouterConstants.checkout),
              ),
              _DishTile(
                tag: appLoc.popular,
                tagColor: AppTheme.cyanColor,
                name: 'Paneer Tikka Bowl',
                desc: 'Cottage cheese, rice, roasted veggies, mint chutney',
                price: '₹279',
                cal: '480 cal · 22g protein',
                color: const Color(0xFFEAD2CE),
                onAdd: () => GoRouter.of(context).pushNamed(AppRouterConstants.checkout),
              ),
              _DishTile(
                tag: appLoc.lowCal,
                tagColor: AppTheme.emeraldText,
                name: 'Quinoa Salad Bowl',
                desc: 'Quinoa, chickpeas, mixed greens, lemon dressing',
                price: '₹249',
                cal: '340 cal · 16g protein',
                color: const Color(0xFFDDE6CE),
                onAdd: () => GoRouter.of(context).pushNamed(AppRouterConstants.checkout),
              ),
              _DishTile(
                tag: '',
                tagColor: AppTheme.transparentColor,
                name: 'Egg Fried Rice',
                desc: 'Wok-tossed rice, eggs, Asian vegetables, soy',
                price: '₹199',
                cal: '380 cal · 12g protein',
                color: const Color(0xFFF1E4C8),
                onAdd: () => GoRouter.of(context).pushNamed(AppRouterConstants.checkout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DishTile extends StatelessWidget {
  final String tag;
  final Color tagColor;
  final String name;
  final String desc;
  final String price;
  final String cal;
  final Color color;
  final VoidCallback onAdd;

  const _DishTile({
    required this.tag,
    required this.tagColor,
    required this.name,
    required this.desc,
    required this.price,
    required this.cal,
    required this.color,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                if (tag.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      tag,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: tagColor,
                      ),
                    ),
                  ),
                Text(
                  name,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  desc,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      price,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.caTextPrimary,
                      ),
                    ),
                    Text(
                      '· $cal',
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: AppTheme.caTextWarmGray,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    showCustomizeSheet(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      appLoc.customizeArrow,
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
          ),
          Column(
            spacing: 8,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(99),
                onTap: () {
                  HapticFeedback.heavyImpact();
                  onAdd();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.transparentColor,
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                      color: AppTheme.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    appLoc.add,
                    style: theme.textTheme.labelSmall!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

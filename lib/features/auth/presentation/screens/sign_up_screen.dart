import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/common/widgets/k_filled_btn.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/auth/presentation/widgets/k_chip_select.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController(text: 'Gowtham');
  final TextEditingController _email = TextEditingController();
  String _diet = 'nonVeg';
  final Set<String> _allergens = {'dairy'};

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.setUpYourProfile),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              _Field(
                label: appLoc.fullName,
                controller: _name,
              ),
              _Field(
                label: appLoc.emailOptional,
                controller: _email,
                hintText: appLoc.emailHint,
              ),
              _Label(text: appLoc.dietaryPreference),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _dietChip('nonVeg', appLoc.nonVeg, AppTheme.macroProtein),
                  _dietChip('veg', appLoc.veg, AppTheme.primaryColor),
                  _dietChip('vegan', appLoc.vegan, AppTheme.primaryColor),
                  _dietChip('jain', appLoc.jain, AppTheme.primaryColor),
                ],
              ),
              _Label(text: appLoc.allergens),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _allergenChip('nuts', appLoc.nuts),
                  _allergenChip('dairy', appLoc.dairy),
                  _allergenChip('gluten', appLoc.gluten),
                  _allergenChip('soy', appLoc.soy),
                  _allergenChip('eggs', appLoc.eggs),
                  _allergenChip('sesame', appLoc.sesame),
                ],
              ),
              _Label(text: appLoc.deliveryAddress),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
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
                child: Row(
                  spacing: 8,
                  children: [
                    const Icon(Icons.search, size: 18, color: AppTheme.caTextMuted),
                    Expanded(
                      child: Text(
                        appLoc.searchAddressHint,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: AppTheme.caTextMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  KFeedback.show(context, 'Map picker coming soon');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    appLoc.orPickFromMap,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              KFilledBtn(
                onTap: () =>
                    GoRouter.of(context).goNamed(AppRouterConstants.home),
                btnText: appLoc.completeSetup,
              ),
              Center(
                child: Text(
                  appLoc.skipForNow,
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

  Widget _dietChip(String key, String label, Color bg) {
    return KChipSelect(
      label: label,
      selected: _diet == key,
      selectedBg: bg,
      onTap: () => setState(() => _diet = key),
    );
  }

  Widget _allergenChip(String key, String label) {
    return KChipSelect(
      label: label,
      selected: _allergens.contains(key),
      selectedBg: const Color(0xFFFAE0E3),
      selectedFg: const Color(0xFFB23A48),
      onTap: () => setState(() {
        if (!_allergens.add(key)) _allergens.remove(key);
      }),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  const _Field({required this.label, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppTheme.caTextSecondary,
          ),
        ),
        TextFormField(
          controller: controller,
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
              color: AppTheme.caTextMuted,
            ),
            filled: true,
            fillColor: isDark
                ? AppTheme.darkSurfaceColor
                : AppTheme.contentCard,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppTheme.contentCardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppTheme.contentCardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppTheme.primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        text,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppTheme.caTextSecondary,
        ),
      ),
    );
  }
}

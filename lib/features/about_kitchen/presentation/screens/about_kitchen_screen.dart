import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_profile_avatar.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AboutKitchenScreen extends StatelessWidget {
  const AboutKitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.aboutTitle),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 140,
                color: const Color(0xFFE8F0DC),
                alignment: Alignment.center,
                child: Text(
                  appLoc.addKitchenPhoto,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 13,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -28),
                child: Column(
                  children: [
                    KProfileAvatar(
                      initials: 'FK',
                      height: 56,
                      width: 56,
                      backgroundColor: AppTheme.primaryColor,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appLoc.kitchenName,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appLoc.kitchenTagline,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: AppTheme.caTextWarmGray,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.contentDivider,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          const Text('★ 4.8'),
                          Text(
                            '· ${appLoc.subscribers500}',
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: AppTheme.caTextWarmGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _InfoRow(label: appLoc.location, value: appLoc.locationValue),
                    _InfoRow(label: appLoc.since, value: appLoc.sinceValue),
                    _InfoRow(label: appLoc.cuisines, value: appLoc.cuisinesValue),
                    _InfoRow(label: appLoc.speciality, value: appLoc.specialityValue),
                    _InfoRow(label: appLoc.fssaiLicense, value: appLoc.fssaiValue),
                    const SizedBox(height: 16),
                    Text(
                      appLoc.headChef,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.darkSurfaceColor
                            : AppTheme.contentCard,
                        borderRadius: BorderRadius.circular(14),
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
                          KProfileAvatar(
                            initials: 'CA',
                            height: 44,
                            width: 44,
                            backgroundColor: const Color(0xFFE9A23B),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Text(
                                  appLoc.chefName,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isDark
                                        ? AppTheme.secondaryColor
                                        : AppTheme.caTextPrimary,
                                  ),
                                ),
                                Text(
                                  appLoc.chefBio,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: AppTheme.caTextWarmGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      appLoc.contactKitchen,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: _ContactCard(label: appLoc.call, value: '+91 98765 43210'),
                        ),
                        Expanded(
                          child: _ContactCard(label: appLoc.whatsapp, value: appLoc.chatWithUs),
                        ),
                        Expanded(
                          child: _ContactCard(label: appLoc.email, value: appLoc.emailKitchen),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppTheme.caTextWarmGray,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Divider(
            height: 1,
            thickness: 1,
            color: isDark
                ? AppTheme.darkBorderColor
                : AppTheme.contentDivider,
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final String label;
  final String value;
  const _ContactCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Column(
        spacing: 4,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextSecondary,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppTheme.secondaryColor
                  : AppTheme.caTextPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

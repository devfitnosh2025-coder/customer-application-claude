import 'package:customer_app/common/widgets/k_adaptive_alert_dialog_box.dart';
import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:customer_app/features/profile/presentation/widgets/profile_logout_button.dart';
import 'package:customer_app/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:customer_app/features/profile/presentation/widgets/profile_section_group.dart';
import 'package:customer_app/features/profile/presentation/widgets/profile_section_header.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: const KAppBar(showBack: true),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileHeaderCard(
                name: "Gowtham",
                onEditTap: () => KFeedback.show(context, 'Edit profile coming soon'),
              ),

              // Subscription
              ProfileSectionHeader(label: appLoc.sectionSubscription),
              ProfileSectionGroup(
                children: [
                  ProfileMenuTile(
                    leadingIcon: Icons.refresh_rounded,
                    leadingColor: AppTheme.emeraldText,
                    leadingBgColor: AppTheme.emeraldLight,
                    label: appLoc.mySubscription,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.mySubscription),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.shopping_bag_outlined,
                    leadingColor: AppTheme.emeraldText,
                    leadingBgColor: AppTheme.emeraldLight,
                    label: appLoc.myOrders,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.myOrders),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.receipt_long_outlined,
                    leadingColor: AppTheme.cyanColor,
                    leadingBgColor: AppTheme.cyanBgTint,
                    label: appLoc.billingHistory,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.billingHistory),
                    showDivider: false,
                  ),
                ],
              ),

              // Payments
              ProfileSectionHeader(label: appLoc.sectionPayments),
              ProfileSectionGroup(
                children: [
                  ProfileMenuTile(
                    leadingIcon: Icons.currency_rupee_rounded,
                    leadingColor: AppTheme.emeraldText,
                    leadingBgColor: AppTheme.emeraldLight,
                    label: appLoc.paymentMethods,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.paymentMethods),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.account_balance_wallet_outlined,
                    leadingColor: const Color(0xFFB8860B),
                    leadingBgColor: const Color(0xFFFFF4D6),
                    label: appLoc.walletCredits,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.walletCredits),
                    showDivider: false,
                  ),
                ],
              ),

              // Account
              ProfileSectionHeader(label: appLoc.sectionAccount),
              ProfileSectionGroup(
                children: [
                  ProfileMenuTile(
                    leadingIcon: Icons.location_on_outlined,
                    leadingColor: const Color(0xFFB23A48),
                    leadingBgColor: const Color(0xFFFAE0E3),
                    label: appLoc.addresses,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.addresses),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.favorite_border_rounded,
                    leadingColor: AppTheme.caTextPrimary,
                    leadingBgColor: AppTheme.contentDivider,
                    label: appLoc.dietaryPreferences,
                    onTap: () => KFeedback.show(
                        context, 'Dietary preferences saved'),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.star_border_rounded,
                    leadingColor: const Color(0xFFB8860B),
                    leadingBgColor: const Color(0xFFFFF4D6),
                    label: appLoc.referralProgram,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.referralProgram),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.notifications_none_rounded,
                    leadingColor: AppTheme.cyanColor,
                    leadingBgColor: AppTheme.cyanBgTint,
                    label: appLoc.notifications,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.notificationsScreen),
                    showDivider: false,
                  ),
                ],
              ),

              // Support
              ProfileSectionHeader(label: appLoc.sectionSupport),
              ProfileSectionGroup(
                children: [
                  ProfileMenuTile(
                    leadingIcon: Icons.help_outline_rounded,
                    leadingColor: AppTheme.caTextPrimary,
                    leadingBgColor: AppTheme.contentDivider,
                    label: appLoc.helpCenter,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.helpCenter),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.storefront_outlined,
                    leadingColor: AppTheme.caTextPrimary,
                    leadingBgColor: AppTheme.contentDivider,
                    label: appLoc.aboutKitchen,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(AppRouterConstants.aboutKitchen),
                  ),
                  ProfileMenuTile(
                    leadingIcon: Icons.star_border_rounded,
                    leadingColor: const Color(0xFFB8860B),
                    leadingBgColor: const Color(0xFFFFF4D6),
                    label: appLoc.rateApp,
                    onTap: () => KFeedback.show(context, 'Thanks for rating!'),
                    showDivider: false,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              ProfileLogoutButton(
                label: appLoc.logout,
                onTap: () => _showLogoutDialog(context, appLoc),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  appLoc.appVersion,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 11,
                    color: AppTheme.caTextMuted,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AppLocalizations appLoc) {
    showAdaptiveDialog(
      context: context,
      builder: (dialogContext) => KAdaptiveAlertDialogBox(
        title: appLoc.logoutTitle,
        content: appLoc.logoutMessage,
        cancelText: appLoc.cancel,
        confirmText: appLoc.confirm,
        onCancelTap: () => GoRouter.of(dialogContext).pop(),
        onConfirmTap: () => GoRouter.of(dialogContext).pop(),
      ),
    );
  }
}

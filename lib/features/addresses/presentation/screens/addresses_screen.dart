import 'package:customer_app/common/widgets/k_app_bar.dart';
import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/features/addresses/presentation/widgets/address_card.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: KAppBar(title: appLoc.myAddresses),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AddressCard(
                label: appLoc.home,
                addressLine1: '12, Gandhi Nagar, Gandhipuram',
                addressLine2: 'Coimbatore, Tamil Nadu 641012',
                isDefault: true,
                onEditTap: () => KFeedback.show(context, 'Edit ${appLoc.home}'),
                onMoreTap: () => KFeedback.show(context, 'More options'),
              ),
              AddressCard(
                label: appLoc.office,
                addressLine1: '3rd Floor, Tech Park',
                addressLine2: 'RS Puram, Coimbatore 641002',
                onEditTap: () => KFeedback.show(context, 'Edit ${appLoc.office}'),
                onMoreTap: () => KFeedback.show(context, 'More options'),
              ),
              AddressCard(
                label: appLoc.gym,
                addressLine1: 'FitZone, Saibaba Colony',
                addressLine2: 'Coimbatore 641011',
                onEditTap: () => KFeedback.show(context, 'Edit ${appLoc.gym}'),
                onMoreTap: () => KFeedback.show(context, 'More options'),
              ),
              const SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(99),
                onTap: () {
                  HapticFeedback.heavyImpact();
                  KFeedback.show(context, 'New address form coming soon');
                },
                child: Container(
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.transparentColor,
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                      color: AppTheme.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    appLoc.addNewAddress,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
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

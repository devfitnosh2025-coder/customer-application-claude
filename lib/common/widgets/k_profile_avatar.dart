import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class KProfileAvatar extends StatelessWidget {
  final String? personImageUrl;
  final String? initials;
  final double height;
  final double width;
  final Color? backgroundColor;

  const KProfileAvatar({
    super.key,
    this.personImageUrl,
    this.initials,
    this.height = 56,
    this.width = 56,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasImage = personImageUrl != null && personImageUrl!.isNotEmpty;
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: hasImage
          ? CachedNetworkImage(
              imageUrl: personImageUrl!,
              fit: BoxFit.cover,
              placeholder: (_, _) => const SizedBox.shrink(),
              errorWidget: (_, _, _) => _initialsLabel(theme),
            )
          : _initialsLabel(theme),
    );
  }

  Widget _initialsLabel(ThemeData theme) {
    return Center(
      child: Text(
        (initials ?? "").toUpperCase(),
        style: theme.textTheme.headlineMedium!.copyWith(
          color: AppTheme.secondaryColor,
          fontWeight: FontWeight.w700,
          fontSize: height * 0.42,
        ),
      ),
    );
  }
}

import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBack;
  final List<Widget>? actions;

  const KAppBar({
    super.key,
    this.title,
    this.showBack = true,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    bool canPop = false;
    try {
      canPop = GoRouter.of(context).canPop();
    } catch (_) {
      canPop = false;
    }
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: (showBack && canPop)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: isDark ? AppTheme.secondaryColor : AppTheme.caTextPrimary,
              ),
              onPressed: () {
                HapticFeedback.heavyImpact();
                GoRouter.of(context).pop();
              },
            )
          : null,
      title: title == null
          ? null
          : Text(
              title!,
              style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
      actions: actions,
    );
  }
}

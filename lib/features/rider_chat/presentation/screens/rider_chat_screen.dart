import 'package:customer_app/common/widgets/k_feedback.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class RiderChatScreen extends StatelessWidget {
  const RiderChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : AppTheme.contentBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () {
            HapticFeedback.heavyImpact();
            GoRouter.of(context).pop();
          },
        ),
        title: Row(
          spacing: 10,
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.primaryColor,
              child: Text(
                'K',
                style: TextStyle(
                  color: AppTheme.secondaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Karthik',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '${appLoc.onTheWayShort} · 2.3 ${appLoc.kmAway}',
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: 11,
                      color: AppTheme.caTextWarmGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.call_rounded,
              size: 18,
              color: AppTheme.caTextPrimary,
            ),
            onPressed: () {
              HapticFeedback.heavyImpact();
              KFeedback.show(context, 'Calling Karthik…');
            },
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                children: [
                  _bubble(
                    theme,
                    'Karthik picked up your order',
                    isMine: false,
                    time: '12:18 PM',
                    isSystem: true,
                  ),
                  _bubble(
                    theme,
                    'On my way! Will reach in about 12 minutes',
                    isMine: false,
                    time: '12:20 PM',
                  ),
                  _bubble(
                    theme,
                    "Great, I'll be at the gate",
                    isMine: true,
                    time: '12:21 PM',
                  ),
                  _bubble(
                    theme,
                    'Sure! Almost there',
                    isMine: false,
                    time: '12:30 PM',
                  ),
                ],
              ),
            ),
            _QuickReplies(),
            _Composer(),
          ],
        ),
      ),
    );
  }

  Widget _bubble(
    ThemeData theme,
    String text, {
    required bool isMine,
    required String time,
    bool isSystem = false,
  }) {
    if (isSystem) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.contentDivider,
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            text,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextSecondary,
            ),
          ),
        ),
      );
    }
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: const BoxConstraints(maxWidth: 260),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isMine ? AppTheme.primaryColor : AppTheme.contentCard,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMine ? 16 : 4),
            bottomRight: Radius.circular(isMine ? 4 : 16),
          ),
          border: isMine
              ? null
              : Border.all(color: AppTheme.contentCardBorder, width: 1),
        ),
        child: Column(
          crossAxisAlignment:
              isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 13,
                color: isMine
                    ? AppTheme.secondaryColor
                    : AppTheme.caTextPrimary,
              ),
            ),
            Text(
              time,
              style: theme.textTheme.labelSmall!.copyWith(
                fontSize: 10,
                color: isMine
                    ? AppTheme.secondaryColor.withValues(alpha: 0.8)
                    : AppTheme.caTextMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickReplies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    final replies = [
      appLoc.imAtTheGate,
      appLoc.pleaseCallMe,
      appLoc.leaveAtDoor,
      appLoc.fiveMoreMinutes,
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            appLoc.quickReplies,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.caTextSecondary,
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final r in replies)
                InkWell(
                  borderRadius: BorderRadius.circular(99),
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    KFeedback.show(context, 'Sent: $r');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.contentCard,
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(
                        color: AppTheme.contentCardBorder,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      r,
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.caTextPrimary,
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

class _Composer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        color: AppTheme.contentCard,
        border: Border(
          top: BorderSide(color: AppTheme.contentCardBorder, width: 1),
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: TextField(
              style: theme.textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: appLoc.typeMessage,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: AppTheme.caTextMuted,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                filled: true,
                fillColor: AppTheme.contentBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(99),
            onTap: () {
              HapticFeedback.heavyImpact();
              KFeedback.show(context, 'Message sent');
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send_rounded,
                color: AppTheme.secondaryColor,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KFilledBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String btnText;
  const KFilledBtn({super.key, required this.onTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          theme.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
      ),
      onPressed: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Text(btnText),
    );
  }
}

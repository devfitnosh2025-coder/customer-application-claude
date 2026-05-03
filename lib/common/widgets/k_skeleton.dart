import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class KSkeleton extends StatefulWidget {
  final double? width;
  final double height;
  final double borderRadius;

  const KSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = 8,
  });

  @override
  State<KSkeleton> createState() => _KSkeletonState();
}

class _KSkeletonState extends State<KSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? AppTheme.darkSurfaceColor : AppTheme.contentDivider;
    final highlight = isDark
        ? AppTheme.darkBorderColor
        : AppTheme.contentCardBorder;
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, _) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1 + _ctrl.value * 2, 0),
              end: Alignment(1 + _ctrl.value * 2, 0),
              colors: [base, highlight, base],
            ),
          ),
        );
      },
    );
  }
}

class KSkeletonCard extends StatelessWidget {
  final double height;
  const KSkeletonCard({super.key, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: KSkeleton(height: height, borderRadius: 16),
    );
  }
}

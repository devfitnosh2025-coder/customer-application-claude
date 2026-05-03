import 'package:customer_app/common/widgets/k_skeleton.dart';
import 'package:flutter/material.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: const [
        KSkeleton(height: 18, width: 160),
        SizedBox(height: 8),
        KSkeleton(height: 14, width: 220),
        SizedBox(height: 16),
        KSkeleton(height: 100, borderRadius: 16),
        SizedBox(height: 16),
        KSkeleton(height: 80, borderRadius: 16),
        SizedBox(height: 24),
        KSkeleton(height: 14, width: 140),
        SizedBox(height: 12),
        KSkeletonCard(height: 90),
        KSkeletonCard(height: 90),
        SizedBox(height: 16),
        KSkeleton(height: 14, width: 160),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: KSkeleton(height: 110, borderRadius: 14)),
            SizedBox(width: 10),
            Expanded(child: KSkeleton(height: 110, borderRadius: 14)),
            SizedBox(width: 10),
            Expanded(child: KSkeleton(height: 110, borderRadius: 14)),
          ],
        ),
      ],
    );
  }
}

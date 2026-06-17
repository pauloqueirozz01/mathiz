// lib/widgets/academic_card.dart

import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_sizes.dart';
import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';

class AcademicCard extends StatelessWidget {
  final Widget child;

  const AcademicCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: child,
      ),
    );
  }
}

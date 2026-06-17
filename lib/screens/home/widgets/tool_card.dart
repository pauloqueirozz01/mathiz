import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';
import 'package:mathiz/widgets/academic_card.dart';

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ToolCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AcademicCard(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),

                decoration: BoxDecoration(
                  color: AppColors.tertiary.withValues(alpha: .15),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(icon, size: 36, color: AppColors.primary),
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                title,
                style: AppTextStyles.headlineLG.copyWith(
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              Text(description, style: AppTextStyles.bodyMD),
            ],
          ),
        ),
      ),
    );
  }
}

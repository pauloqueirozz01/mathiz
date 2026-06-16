import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_sizes.dart';
import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class DashboardCard extends StatelessWidget {
  static const double _iconContainerSize = 52.0;
  static const double _iconSize = 28.0;

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final bool enabled;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = enabled ? AppColors.surface : AppColors.surfaceContainerLow;

    return Card(
      elevation: 0,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _iconContainerSize,
                height: _iconContainerSize,
                decoration: BoxDecoration(
                  color: AppColors.tertiary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                ),
                child: Icon(
                  icon,
                  size: _iconSize,
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                title,
                style: AppTextStyles.bodyMD.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Expanded(
                child: Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMD.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Text(
                    enabled ? 'Abrir' : 'Em breve',
                    style: AppTextStyles.labelMono.copyWith(
                      color: enabled ? AppColors.primary : AppColors.secondary,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    enabled ? Icons.arrow_forward_rounded : Icons.schedule,
                    color: enabled ? AppColors.primary : AppColors.secondary,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

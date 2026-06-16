import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_sizes.dart';
import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class AppHeader extends StatelessWidget {
  static const double _iconButtonSize = 40.0;
  static const double _logoSize = 28.0;

  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;

  const AppHeader({
    super.key,
    this.title = 'Mathiz',
    this.onMenuTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.outlineVariant),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            _HeaderIconButton(
              icon: Icons.menu,
              tooltip: 'Menu',
              onTap: onMenuTap,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: _logoSize,
                      height: _logoSize,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.headlineLG.copyWith(
                        color: AppColors.primary,
                        fontSize: AppSizes.bodyMD,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            _HeaderIconButton(
              icon: Icons.account_circle_outlined,
              tooltip: 'Perfil',
              onTap: onProfileTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  static const double _size = 40.0;

  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;

  const _HeaderIconButton({
    required this.icon,
    required this.tooltip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: IconButton(
        onPressed: onTap,
        tooltip: tooltip,
        icon: Icon(icon),
        style: IconButton.styleFrom(
          backgroundColor: AppColors.surfaceContainerLow,
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusSM),
          ),
        ),
      ),
    );
  }
}

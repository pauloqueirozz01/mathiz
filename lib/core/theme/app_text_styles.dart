import 'package:flutter/material.dart';

import 'app_typography.dart';

class AppTextStyles {
  static const TextStyle headlineXL = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: AppTypography.headlineXL,
    height: AppTypography.lineHeightTight,
    letterSpacing: AppTypography.trackingTight,
  );

  static const TextStyle headlineLG = TextStyle(
    fontFamily: 'Hanken Grotesk',
    fontSize: AppTypography.headlineLG,
    height: AppTypography.lineHeightNormal,
    fontWeight: AppTypography.bold,
  );

  static const TextStyle bodyMD = TextStyle(
    fontFamily: 'Inter',
    fontSize: AppTypography.bodyMedium,
  );

  static const TextStyle labelMono = TextStyle(
    fontFamily: 'JetBrains Mono',
    fontSize: AppTypography.label,
    fontWeight: AppTypography.regular,
  );
}

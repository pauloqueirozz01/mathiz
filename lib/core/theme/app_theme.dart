import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // Background geral do App:
    scaffoldBackgroundColor: AppColors.neutral,
    //Cores da aplicação:
    primaryColor: AppColors.primary,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.neutral,
      elevation: 0,
      centerTitle: true,
    ),

    //Tema de texto global
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headlineXL,
      headlineMedium: AppTextStyles.headlineLG,
      bodyMedium: AppTextStyles.bodyMD,
      labelMedium: AppTextStyles.labelMono,
    ),

    //Botoes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    //Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.secondary),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.tertiary, width: 2),
      ),
    ),
  );

  static const TextStyle headlineXtraLarge = TextStyle(
    fontFamily: "Hanken Grotesk",
    fontSize: 40,
    fontWeight: FontWeight(700),
    height: 48,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: "Hanken Grotesk",
    fontSize: 32,
    fontWeight: FontWeight(600),
    height: 40,
  );

  static const TextStyle bodyTextStyle = TextStyle();
}

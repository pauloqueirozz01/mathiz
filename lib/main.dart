import 'package:flutter/material.dart';
import 'package:mathiz/core/navigation/app_routes.dart';
import 'package:mathiz/screens/history/history_screen.dart';
import 'package:mathiz/screens/logic/logic_screen.dart';
import 'package:mathiz/screens/matrix/matrix_screen.dart';
import 'core/theme/app_theme.dart';

import 'package:mathiz/screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MathizApp());
}

class MathizApp extends StatelessWidget {
  const MathizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove banner DEBUG
      debugShowCheckedModeBanner: false,

      // Nome do aplicativo
      title: 'Mathiz',

      // Tema global
      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.splash,

      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.matrix: (_) => const MatrixScreen(),
        AppRoutes.logic: (_) => const LogicScreen(),
        AppRoutes.history: (_) => const HistoryScreen(),
      },

      // Primeira tela do app
      home: const SplashScreen(),
    );
  }
}

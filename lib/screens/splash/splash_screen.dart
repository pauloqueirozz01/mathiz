import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';
import 'package:mathiz/core/constants/app_spacing.dart';

import 'package:mathiz/core/navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _initializeApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),

            ScaleTransition(
              scale: _logoAnimation,
              child: Image.asset('assets/logo.png', width: 140),
            ),

            const SizedBox(height: 32),

            Text('Mathiz', style: AppTextStyles.headlineXL),

            const SizedBox(height: 8),

            Text('EDUCAÇÃO & LÓGICA', style: AppTextStyles.labelMono),

            const SizedBox(height: 64),

            SizedBox(
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: const LinearProgressIndicator(
                  minHeight: 4,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text('INICIALIZANDO SISTEMA', style: AppTextStyles.labelMono),

            const Spacer(),

            Text('Versão 1.0', style: AppTextStyles.bodyMD),

            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

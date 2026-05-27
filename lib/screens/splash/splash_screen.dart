import 'package:flutter/material.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'dart:async';

import 'package:mathiz/core/theme/app_text_styles.dart';

void main() {
  runWidget(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      print("Ir para home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png", width: 120),

            const SizedBox(height: 24),

            const Text("Mathiz", style: AppTextStyles.headlineXL),

            const LinearProgressIndicator(
              backgroundColor: AppColors.secondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.tertiary),
            ),

            const Text("Inicializando o Sitema", style: AppTextStyles.bodyMD),
          ],
        ),
      ),
    );
  }
}

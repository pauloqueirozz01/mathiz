import "package:flutter/material.dart";
import "package:mathiz/core/constants/app_spacing.dart";
import "package:mathiz/core/navigation/app_routes.dart";
import "package:mathiz/core/theme/app_text_styles.dart";
import "package:mathiz/widgets/app_bottom_navigation.dart";
import "widgets/welcome_section.dart";
import "widgets/feature_card.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 0),
      body: SafeArea(
        child: Column(
          children: [
            WelcomeSection(),
            FeatureCard(
              icon: Icons.grid_on,
              title: "Operações com Matrizes",
              description:
                  "Calcule determinantes, inversas e operações fundamentais.",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.matrix);
              },
            ),
            FeatureCard(
              icon: Icons.rule,
              title: "Tabelas-Verdade",
              description:
                  "Analise proposições lógicas, tautologias e contradições através da estruturação rigorosa de valores lógicos.",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.logic);
              },
            ),
          ],
        ),
      ),
    );
  }
}

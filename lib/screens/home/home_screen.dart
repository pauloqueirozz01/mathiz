import 'package:flutter/material.dart';

import 'package:mathiz/core/navigation/app_routes.dart';
import 'package:mathiz/core/constants/app_spacing.dart';

import 'package:mathiz/widgets/app_header.dart';
import 'package:mathiz/widgets/app_bottom_navigation.dart';

import 'widgets/home_hero_section.dart';
import 'widgets/tool_card.dart';
import 'widgets/recent_history_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 0),

      body: Column(
        children: [
          const AppHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const HomeHeroSection(),

                  const SizedBox(height: 32),

                  ToolCard(
                    icon: Icons.grid_on,
                    title: "Operações com Matrizes",
                    description:
                        "Calcule determinantes, inversas e operações fundamentais em espaços lineares com precisão acadêmica.",

                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.matrix);
                    },
                  ),

                  const SizedBox(height: 20),

                  ToolCard(
                    icon: Icons.rule,
                    title: "Tabelas-Verdade",
                    description:
                        "Analise proposições lógicas, tautologias e contradições através da estruturação rigorosa de valores verdade.",

                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.logic);
                    },
                  ),

                  const SizedBox(height: 32),

                  Row(
                    children: const [
                      Icon(Icons.history),

                      SizedBox(width: 8),

                      Text("HISTÓRICO RECENTE"),
                    ],
                  ),

                  SizedBox(height: 16),

                  RecentHistorySection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mathiz/core/navigation/app_routes.dart';
import 'package:mathiz/core/theme/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,

      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;

          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.matrix);
            break;

          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.logic);
            break;

          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.history);
            break;
        }
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: AppColors.primary,
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.grid_on),
          backgroundColor: AppColors.primary,
          label: "Matrizes",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.rule),
          backgroundColor: AppColors.primary,
          label: "Lógica",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          backgroundColor: AppColors.primary,
          label: "Histórico",
        ),
      ],
    );
  }
}

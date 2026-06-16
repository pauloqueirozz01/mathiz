import 'package:flutter/material.dart';
import "package:mathiz/widgets/app_bottom_navigation.dart";

class LogicScreen extends StatelessWidget {
  const LogicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Tabelas-Verdade")],
        ),
      ),
    );
  }
}

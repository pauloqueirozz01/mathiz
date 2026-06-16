import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mathiz/screens/home/home_screen.dart';
import 'package:mathiz/widgets/app_header.dart';

void main() {
  testWidgets('AppHeader renders the expected chrome', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppHeader(title: 'Mathiz'),
        ),
      ),
    );

    expect(find.text('Mathiz'), findsWidgets);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byIcon(Icons.account_circle_outlined), findsOneWidget);
  });

  testWidgets('HomeScreen renders the dashboard shell', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('Ferramentas Matemáticas'), findsOneWidget);
    expect(find.text('Selecione uma ferramenta para começar.'), findsOneWidget);
    expect(find.text('Matrizes'), findsOneWidget);
    expect(find.text('Tabela Verdade'), findsOneWidget);
    expect(find.byIcon(Icons.grid_on), findsWidgets);
    expect(find.byIcon(Icons.rule), findsWidgets);
  });
}

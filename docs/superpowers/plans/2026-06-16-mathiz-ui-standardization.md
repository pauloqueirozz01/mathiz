# Mathiz UI Standardization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Standardize the visual language of `HomeScreen`, `MatrixScreen`, and `HistoryScreen` so they match the current `LogicScreen` and the `DESIGN-3.md` system.

**Architecture:** Introduce a reusable `AppHeader` plus a small set of shared UI primitives for section titles and cards. Keep all business logic, Hive access, and navigation intact; only replace layout, spacing, and presentation in the three target screens and the matrix/history helper widgets they already depend on.

**Tech Stack:** Flutter, existing `AppColors`, `AppTextStyles`, existing navigation routes, existing `HistoryService`, existing matrix and history services.

---

### Task 1: Add shared UI primitives

**Files:**
- Create: `lib/widgets/app_header.dart`
- Create: `lib/widgets/section_title.dart`
- Create: `lib/widgets/dashboard_card.dart`
- Modify: `lib/core/theme/app_colors.dart`

- [ ] **Step 1: Write the failing test**

Add a widget test that pumps a tiny scaffold using `AppHeader` and `DashboardCard`, then asserts the header shows the menu, logo/name, and profile actions, and the card exposes icon/title/description text.

```dart
testWidgets('shared header and dashboard card render expected labels', (tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            AppHeader(title: 'Mathiz'),
            DashboardCard(
              icon: Icons.grid_on,
              title: 'Matrizes',
              description: 'Operações matriciais',
            ),
          ],
        ),
      ),
    ),
  );

  expect(find.text('Mathiz'), findsOneWidget);
  expect(find.text('Matrizes'), findsOneWidget);
  expect(find.text('Operações matriciais'), findsOneWidget);
});
```

- [ ] **Step 2: Run the test and verify it fails**

Run: `flutter test test/widget_test.dart`
Expected: fail because `AppHeader` and `DashboardCard` do not exist yet.

- [ ] **Step 3: Implement the primitives**

Create a compact header with menu and profile icon buttons plus a centered logo/name row. Create a reusable card widget for dashboard/tile navigation and a small section title widget for repeated headings.

```dart
class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) => ...
}
```

- [ ] **Step 4: Run the test and verify it passes**

Run: `flutter test test/widget_test.dart`
Expected: pass.

- [ ] **Step 5: Commit**

```bash
git add lib/widgets/app_header.dart lib/widgets/section_title.dart lib/widgets/dashboard_card.dart lib/core/theme/app_colors.dart test/widget_test.dart
git commit -m "feat: add shared ui primitives for app chrome"
```

### Task 2: Refactor HomeScreen into a dashboard

**Files:**
- Modify: `lib/screens/home/home_screen.dart`
- Modify: `lib/screens/home/widgets/welcome_section.dart` if still needed, or remove usage if the new screen owns the header/title layout
- Modify: `lib/screens/home/widgets/feature_card.dart` if it remains part of the dashboard
- Test: `test/widget_test.dart`

- [ ] **Step 1: Write the failing test**

Add a widget test that pumps `HomeScreen` and verifies:
- the shared header is visible
- the title `Ferramentas Matemáticas` is visible
- both dashboard entries `Matrizes` and `Tabela Verdade` render
- tapping each card navigates to the expected route

```dart
expect(find.text('Ferramentas Matemáticas'), findsOneWidget);
expect(find.text('Matrizes'), findsOneWidget);
expect(find.text('Tabela Verdade'), findsOneWidget);
```

- [ ] **Step 2: Run the test and verify it fails**

Run: `flutter test test/widget_test.dart`
Expected: fail until the dashboard layout is replaced.

- [ ] **Step 3: Implement the dashboard layout**

Replace the current stacked welcome/feature layout with:
- `AppHeader`
- a section title block
- a responsive grid or wrap of compact navigation cards
- a short description line

Keep the navigation targets the same:
`AppRoutes.matrix` and `AppRoutes.logic`.

- [ ] **Step 4: Run the test and verify it passes**

Run: `flutter test test/widget_test.dart`
Expected: pass.

- [ ] **Step 5: Commit**

```bash
git add lib/screens/home/home_screen.dart lib/screens/home/widgets/welcome_section.dart lib/screens/home/widgets/feature_card.dart test/widget_test.dart
git commit -m "feat: refactor home into dashboard layout"
```

### Task 3: Refactor MatrixScreen visual shell

**Files:**
- Modify: `lib/screens/matrix/matrix_screen.dart`
- Modify: `lib/screens/matrix/widgets/matrix_configuration_card.dart`
- Modify: `lib/screens/matrix/widgets/matrix_grid_widget.dart`
- Test: `test/widget_test.dart`

- [ ] **Step 1: Write the failing test**

Add a widget test that pumps `MatrixScreen` and checks for:
- `Matrizes`
- `Realize operações matriciais e visualize os resultados.`
- a configuration card title
- the primary action button

```dart
expect(find.text('Matrizes'), findsWidgets);
expect(find.text('Realize operações matriciais e visualize os resultados.'), findsOneWidget);
expect(find.text('Calcular'), findsOneWidget);
```

- [ ] **Step 2: Run the test and verify it fails**

Run: `flutter test test/widget_test.dart`
Expected: fail until the MatrixScreen shell is restyled.

- [ ] **Step 3: Rebuild the UI shell**

Wrap the page with `AppHeader`, apply the shared spacing scale, and present the existing configuration/grid/result flow as distinct cards. Keep all current matrix math and save-to-history behavior unchanged.

Update `MatrixConfigurationCard` and `MatrixGridWidget` so they use the shared colors, typography, and border radius tokens instead of inline styling.

- [ ] **Step 4: Run the test and verify it passes**

Run: `flutter test test/widget_test.dart`
Expected: pass.

- [ ] **Step 5: Commit**

```bash
git add lib/screens/matrix/matrix_screen.dart lib/screens/matrix/widgets/matrix_configuration_card.dart lib/screens/matrix/widgets/matrix_grid_widget.dart test/widget_test.dart
git commit -m "feat: restyle matrix screen to match design system"
```

### Task 4: Refactor HistoryScreen around the latest activity and activity list

**Files:**
- Modify: `lib/screens/history/history_screen.dart`
- Create: `lib/widgets/history_last_result.dart`
- Create: `lib/widgets/history_card.dart`
- Test: `test/widget_test.dart`

- [ ] **Step 1: Write the failing test**

Add a widget test that pumps `HistoryScreen` with existing Hive data and verifies:
- the last-result card is shown when history exists
- the search hint `Pesquisar histórico...` is visible
- the list renders at least one known title from seeded data

```dart
expect(find.text('Pesquisar histórico...'), findsOneWidget);
expect(find.text('Último Resultado'), findsOneWidget);
```

- [ ] **Step 2: Run the test and verify it fails**

Run: `flutter test test/widget_test.dart`
Expected: fail until the history page is rebuilt.

- [ ] **Step 3: Implement the history layout**

Use `HistoryService.getLastActivity()` for the top card and `HistoryService.getAll()` for the list. Add a search field, filter/clear buttons, category icons, and a relative date formatter in the UI layer only.

- [ ] **Step 4: Run the test and verify it passes**

Run: `flutter test test/widget_test.dart`
Expected: pass.

- [ ] **Step 5: Commit**

```bash
git add lib/screens/history/history_screen.dart lib/widgets/history_last_result.dart lib/widgets/history_card.dart test/widget_test.dart
git commit -m "feat: restyle history screen and activity cards"
```

### Task 5: Final verification and cleanup

**Files:**
- Modify: `lib/widgets/app_header.dart`
- Modify: `lib/screens/home/home_screen.dart`
- Modify: `lib/screens/matrix/matrix_screen.dart`
- Modify: `lib/screens/history/history_screen.dart`
- Modify: `test/widget_test.dart`

- [ ] **Step 1: Run the focused tests**

Run: `flutter test test/widget_test.dart`
Expected: all tests pass.

- [ ] **Step 2: Run the full suite**

Run: `flutter test`
Expected: all tests pass.

- [ ] **Step 3: Run analysis**

Run: `flutter analyze`
Expected: no new issues introduced by the UI refactor.

- [ ] **Step 4: Inspect the diff**

Run: `git diff --stat`
Expected: only the intended UI and test files changed.

- [ ] **Step 5: Commit the completed UI standardization**

```bash
git add lib/widgets lib/screens/home lib/screens/matrix lib/screens/history test/widget_test.dart
git commit -m "feat: standardize mathiz ui across screens"
```


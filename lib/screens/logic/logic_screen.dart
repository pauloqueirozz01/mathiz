import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_sizes.dart';
import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';
import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/services/history_service.dart';
import 'package:mathiz/services/logic_classifier_service.dart';
import 'package:mathiz/services/logic_evaluator_service.dart';
import 'package:mathiz/services/logic_parser_service.dart';
import 'package:mathiz/services/truth_table_service.dart';
import 'package:mathiz/widgets/app_bottom_navigation.dart';

class LogicScreen extends StatefulWidget {
  const LogicScreen({super.key});

  @override
  State<LogicScreen> createState() => _LogicScreenState();
}

class _LogicScreenState extends State<LogicScreen> {
  static const double _contentMaxWidth = 1200.0;
  static const int _inputMinLines = 3;
  static const double _operatorButtonSize = 44.0;
  static const double _indicatorSize = 10.0;
  static const double _iconContainerSize = 48.0;
  static const double _emptyIconSize = 56.0;
  static const double _tableColumnSpacing = 28.0;
  static const double _variableCardWidth = 240.0;
  static const double _metricCardWidth = 320.0;
  static const double _bodyLineHeight = 1.5;
  static const double _cardElevation = 0.0;
  static const double _surfaceOpacity = 0.08;
  static const double _mutedOpacity = 0.12;
  static const int _shortAnimationMs = 200;
  static const int _switchAnimationMs = 250;

  static const List<String> _operators = ['¬', '∧', '∨', '→', '↔', '(', ')'];
  static const List<String> _examples = [
    'P ∧ Q',
    'P ∨ Q',
    'P → Q',
    'P ↔ Q',
    'P ∨ ¬P',
    'P ∧ ¬P',
    '(P ∧ Q) → R',
  ];

  static const Map<String, String> _variableDescriptions = {
    'P': 'Primeira proposição',
    'Q': 'Segunda proposição',
    'R': 'Terceira proposição',
    'S': 'Quarta proposição',
  };

  final TextEditingController expressionController = TextEditingController();

  List<String> activeVariables = [];
  List<String> resultVariables = [];
  List<Map<String, bool>> truthTable = [];
  List<bool> results = [];

  String classification = '';
  String generatedExpression = '';
  bool hasGeneratedTable = false;
  bool isLastExpressionValid = false;

  @override
  void initState() {
    super.initState();
    expressionController.addListener(_syncActiveVariables);
  }

  @override
  void dispose() {
    expressionController.removeListener(_syncActiveVariables);
    expressionController.dispose();
    super.dispose();
  }

  void _syncActiveVariables() {
    final extractedVariables = LogicParserService.extractVariables(
      expressionController.text,
    );

    if (_listsMatch(activeVariables, extractedVariables)) {
      return;
    }

    setState(() {
      activeVariables = extractedVariables;
    });
  }

  bool _listsMatch(List<String> first, List<String> second) {
    if (first.length != second.length) {
      return false;
    }

    for (var index = 0; index < first.length; index++) {
      if (first[index] != second[index]) {
        return false;
      }
    }

    return true;
  }

  void insertSymbol(String symbol) {
    final selection = expressionController.selection;
    final text = expressionController.text;
    final selectionStart = selection.start < 0 ? text.length : selection.start;
    final selectionEnd = selection.end < 0 ? text.length : selection.end;
    final normalizedStart = selectionStart.clamp(0, text.length).toInt();
    final normalizedEnd = selectionEnd.clamp(0, text.length).toInt();
    final start = normalizedStart < normalizedEnd
        ? normalizedStart
        : normalizedEnd;
    final end = normalizedStart < normalizedEnd
        ? normalizedEnd
        : normalizedStart;
    final nextText = text.replaceRange(start, end, symbol);
    final nextCursorPosition = start + symbol.length;

    expressionController.value = TextEditingValue(
      text: nextText,
      selection: TextSelection.collapsed(offset: nextCursorPosition),
    );
  }

  void _clearExpression() {
    expressionController.clear();

    setState(() {
      activeVariables = [];
      isLastExpressionValid = false;
    });
  }

  void _fillExpression(String expression) {
    expressionController.value = TextEditingValue(
      text: expression,
      selection: TextSelection.collapsed(offset: expression.length),
    );

    setState(() {
      activeVariables = LogicParserService.extractVariables(expression);
    });
  }

  Future<void> generateTable() async {
    final expression = expressionController.text.trim();
    final expressionIsValid = LogicParserService.validateExpression(expression);

    setState(() {
      isLastExpressionValid = expressionIsValid;
    });

    if (!expressionIsValid) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Expressão inválida')));

      return;
    }

    final extractedVariables = LogicParserService.extractVariables(expression);
    final generatedTable = TruthTableService.generateTable(extractedVariables);
    final calculatedResults = <bool>[];

    for (final row in generatedTable) {
      calculatedResults.add(LogicEvaluatorService.evaluate(expression, row));
    }

    final generatedClassification = LogicClassifierService.classify(
      calculatedResults,
    );

    setState(() {
      activeVariables = extractedVariables;
      resultVariables = extractedVariables;
      truthTable = generatedTable;
      results = calculatedResults;
      classification = generatedClassification;
      generatedExpression = expression;
      hasGeneratedTable = true;
      isLastExpressionValid = true;
    });

    await HistoryService.save(
      HistoryActivity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: 'truth_table',
        category: 'logic',
        title: 'Tabela Verdade',
        description: expression,
        result: generatedClassification,
        createdAt: DateTime.now(),
        metadata: {
          'expression': expression,
          'variables': extractedVariables,
          'classification': generatedClassification,
          'totalRows': generatedTable.length,
          'truthTable': generatedTable,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 2),
      appBar: AppBar(title: const Text('Tabela Verdade')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildPropositionCard(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildVariablesCard(),
                  const SizedBox(height: AppSpacing.lg),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: _switchAnimationMs),
                    child: hasGeneratedTable
                        ? _buildResultsSection()
                        : _buildEmptyState(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tabela Verdade',
          style: AppTextStyles.headlineXL.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Construa proposições lógicas complexas e visualize instantaneamente '
          'sua validade através da análise de todos os estados possíveis.',
          style: AppTextStyles.bodyMD.copyWith(
            color: AppColors.onSurfaceVariant,
            height: _bodyLineHeight,
          ),
        ),
      ],
    );
  }

  Widget _buildPropositionCard() {
    return _academicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Proposição',
            style: AppTextStyles.headlineLG.copyWith(
              color: AppColors.onSurface,
              fontSize: AppSizes.paddingLG,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: expressionController,
            minLines: _inputMinLines,
            maxLines: null,
            style: AppTextStyles.labelMono.copyWith(
              color: AppColors.onSurface,
              fontSize: AppSizes.bodyMD,
              height: _bodyLineHeight,
            ),
            decoration: const InputDecoration(
              hintText: '(P ∧ Q) → R',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildOperatorToolbar(),
          const SizedBox(height: AppSpacing.md),
          _buildActionRow(),
          const SizedBox(height: AppSpacing.lg),
          _buildExamplesSection(),
          const SizedBox(height: AppSpacing.lg),
          _buildPrimaryButton(),
        ],
      ),
    );
  }

  Widget _buildOperatorToolbar() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: _operators
          .map(
            (symbol) => SizedBox.square(
              dimension: _operatorButtonSize,
              child: OutlinedButton(
                onPressed: () => insertSymbol(symbol),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: AppColors.primary,
                  backgroundColor: AppColors.surfaceContainerLow,
                  side: const BorderSide(color: AppColors.outlineVariant),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                  ),
                ),
                child: Text(
                  symbol,
                  style: AppTextStyles.labelMono.copyWith(
                    color: AppColors.primary,
                    fontSize: AppSizes.bodyMD,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildActionRow() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        OutlinedButton.icon(
          onPressed: _clearExpression,
          icon: const Icon(Icons.backspace_outlined),
          label: const Text('Limpar'),
          style: _secondaryButtonStyle(),
        ),
        OutlinedButton.icon(
          onPressed: () => _fillExpression('(P ∧ Q) → R'),
          icon: const Icon(Icons.auto_awesome_outlined),
          label: const Text('Exemplo'),
          style: _secondaryButtonStyle(),
        ),
      ],
    );
  }

  Widget _buildExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exemplos rápidos',
          style: AppTextStyles.bodyMD.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: _examples
              .map(
                (example) => ActionChip(
                  label: Text(example, style: AppTextStyles.labelMono),
                  onPressed: () => _fillExpression(example),
                  backgroundColor: AppColors.surfaceContainerLow,
                  side: const BorderSide(color: AppColors.outlineVariant),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: generateTable,
        icon: const Icon(Icons.analytics),
        label: const Text('Gerar Tabela'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.surface,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusSM),
          ),
          textStyle: AppTextStyles.bodyMD.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildVariablesCard() {
    return _academicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Variáveis Ativas',
            style: AppTextStyles.headlineLG.copyWith(
              color: AppColors.onSurface,
              fontSize: AppSizes.paddingLG,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: _variableDescriptions.entries.map((entry) {
              final isActive = activeVariables.contains(entry.key);

              return AnimatedContainer(
                duration: const Duration(milliseconds: _shortAnimationMs),
                width: _variableCardWidth,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.tertiary.withValues(alpha: _surfaceOpacity)
                      : AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                  border: Border.all(
                    color: isActive
                        ? AppColors.tertiary
                        : AppColors.outlineVariant,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: _indicatorSize,
                      height: _indicatorSize,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.tertiary
                            : AppColors.outlineVariant,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      entry.key,
                      style: AppTextStyles.labelMono.copyWith(
                        color: AppColors.primary,
                        fontSize: AppSizes.bodyMD,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: AppTextStyles.bodyMD.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return _academicCard(
      key: const ValueKey('empty-state'),
      child: Center(
        child: Column(
          children: [
            Container(
              width: _emptyIconSize,
              height: _emptyIconSize,
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: _mutedOpacity),
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              ),
              child: const Icon(
                Icons.table_chart_outlined,
                color: AppColors.info,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Digite uma proposição lógica para gerar uma tabela verdade.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMD.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsSection() {
    return Column(
      key: const ValueKey('results-section'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            _buildMetricCard(
              icon: Icons.verified_outlined,
              title: 'Classificação',
              value: classification,
              color: _classificationColor(classification),
            ),
            _buildMetricCard(
              icon: Icons.format_list_numbered,
              title: 'Estatísticas',
              value: '${truthTable.length} linhas geradas',
              color: AppColors.secondary,
            ),
            _buildMetricCard(
              icon: isLastExpressionValid
                  ? Icons.check_circle_outline
                  : Icons.error_outline,
              title: 'Validação',
              value: isLastExpressionValid
                  ? 'Expressão válida'
                  : 'Expressão inválida',
              color: isLastExpressionValid
                  ? AppColors.success
                  : AppColors.error,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildTruthTableCard(),
      ],
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return SizedBox(
      width: _metricCardWidth,
      child: _academicCard(
        child: Row(
          children: [
            Container(
              width: _iconContainerSize,
              height: _iconContainerSize,
              decoration: BoxDecoration(
                color: color.withValues(alpha: _mutedOpacity),
                borderRadius: BorderRadius.circular(AppSizes.radiusSM),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyMD.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    value,
                    style: AppTextStyles.bodyMD.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTruthTableCard() {
    return _academicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tabela Verdade',
            style: AppTextStyles.headlineLG.copyWith(
              color: AppColors.onSurface,
              fontSize: AppSizes.paddingLG,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: _tableColumnSpacing,
              headingRowColor: WidgetStateProperty.all(
                AppColors.surfaceContainerHigh,
              ),
              dataRowColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.tertiary.withValues(alpha: _mutedOpacity);
                }

                return null;
              }),
              columns: [
                ...resultVariables.map((variable) {
                  return DataColumn(
                    label: Text(
                      variable,
                      style: AppTextStyles.labelMono.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }),
                DataColumn(
                  label: Text(
                    'Resultado Final',
                    style: AppTextStyles.labelMono.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
              rows: List.generate(truthTable.length, (index) {
                final row = truthTable[index];

                return DataRow(
                  color: WidgetStateProperty.all(
                    index.isEven
                        ? AppColors.surface
                        : AppColors.surfaceContainerLow,
                  ),
                  cells: [
                    ...resultVariables.map(
                      (variable) => DataCell(
                        Text(
                          row[variable]! ? 'V' : 'F',
                          style: AppTextStyles.labelMono.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        results[index] ? 'V' : 'F',
                        style: AppTextStyles.labelMono.copyWith(
                          color: results[index]
                              ? AppColors.success
                              : AppColors.error,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            generatedExpression,
            style: AppTextStyles.labelMono.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _academicCard({required Widget child, Key? key}) {
    return Card(
      key: key,
      elevation: _cardElevation,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: child,
      ),
    );
  }

  ButtonStyle _secondaryButtonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.outlineVariant),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
      ),
      textStyle: AppTextStyles.bodyMD.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Color _classificationColor(String value) {
    switch (value) {
      case 'Tautologia':
        return AppColors.success;
      case 'Contradição':
        return AppColors.error;
      default:
        return AppColors.info;
    }
  }
}

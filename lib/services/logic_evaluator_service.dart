class LogicEvaluatorService {
  static bool evaluate(String expression, Map<String, bool> values) {
    expression = _removeExternalParentheses(expression.replaceAll(' ', ''));

    // Variável simples
    if (_isVariable(expression)) {
      return values[expression] ?? false;
    }

    // Negação
    if (expression.startsWith("¬")) {
      return !evaluate(expression.substring(1), values);
    }

    // Bicondicional
    final biconditionalIndex = _findMainOperator(expression, "↔");

    if (biconditionalIndex != -1) {
      final left = expression.substring(0, biconditionalIndex);

      final right = expression.substring(biconditionalIndex + 1);

      return evaluate(left, values) == evaluate(right, values);
    }

    // Implicação
    final implicationIndex = _findMainOperator(expression, "→");

    if (implicationIndex != -1) {
      final left = expression.substring(0, implicationIndex);

      final right = expression.substring(implicationIndex + 1);

      return !evaluate(left, values) || evaluate(right, values);
    }

    // Disjunção
    final orIndex = _findMainOperator(expression, "∨");

    if (orIndex != -1) {
      final left = expression.substring(0, orIndex);

      final right = expression.substring(orIndex + 1);

      return evaluate(left, values) || evaluate(right, values);
    }

    // Conjunção
    final andIndex = _findMainOperator(expression, "∧");

    if (andIndex != -1) {
      final left = expression.substring(0, andIndex);

      final right = expression.substring(andIndex + 1);

      return evaluate(left, values) && evaluate(right, values);
    }

    throw Exception("Não foi possível interpretar a expressão: $expression");
  }

  static bool _isVariable(String expression) {
    return RegExp(r'^[A-Z]$').hasMatch(expression);
  }

  static String _removeExternalParentheses(String expression) {
    while (expression.startsWith("(") &&
        expression.endsWith(")") &&
        _isBalanced(expression.substring(1, expression.length - 1))) {
      expression = expression.substring(1, expression.length - 1);
    }

    return expression;
  }

  static bool _isBalanced(String expression) {
    int depth = 0;

    for (final char in expression.split('')) {
      if (char == '(') depth++;
      if (char == ')') depth--;

      if (depth < 0) {
        return false;
      }
    }

    return depth == 0;
  }

  static int _findMainOperator(String expression, String operator) {
    int depth = 0;

    for (int i = expression.length - 1; i >= 0; i--) {
      final char = expression[i];

      if (char == ')') depth++;
      if (char == '(') depth--;

      if (depth == 0 && char == operator) {
        return i;
      }
    }

    return -1;
  }
}

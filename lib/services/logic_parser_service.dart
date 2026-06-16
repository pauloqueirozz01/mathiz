class LogicParserService {
  static List<String> extractVariables(String expression) {
    final regex = RegExp(r'[A-Z]');

    final variables = regex
        .allMatches(expression)
        .map((e) => e.group(0)!)
        .toSet()
        .toList();

    variables.sort();

    return variables;
  }

  static bool validateExpression(String expression) {
    expression = expression.trim();

    if (expression.isEmpty) {
      return false;
    }

    if (!_hasBalancedParentheses(expression)) {
      return false;
    }

    final validChars = RegExp(r'^[A-Z\s¬∧∨→↔()]+$');

    if (!validChars.hasMatch(expression)) {
      return false;
    }

    expression = expression.replaceAll(' ', '');

    // Não pode terminar com operador
    if (RegExp(r'[¬∧∨→↔]$').hasMatch(expression)) {
      return false;
    }

    // Não pode começar com operador binário
    if (RegExp(r'^[∧∨→↔]').hasMatch(expression)) {
      return false;
    }

    // Operadores binários repetidos
    if (RegExp(r'[∧∨→↔]{2,}').hasMatch(expression)) {
      return false;
    }

    // Parênteses vazios
    if (expression.contains('()')) {
      return false;
    }

    // Variável seguida de variável
    if (RegExp(r'[A-Z]{2,}').hasMatch(expression)) {
      return false;
    }

    // Variável seguida de (
    if (RegExp(r'[A-Z]\(').hasMatch(expression)) {
      return false;
    }

    // ) seguida de variável
    if (RegExp(r'\)[A-Z]').hasMatch(expression)) {
      return false;
    }

    // ) seguida de (
    if (RegExp(r'\)\(').hasMatch(expression)) {
      return false;
    }

    return true;
  }

  static bool _hasBalancedParentheses(String expression) {
    int open = 0;

    for (final char in expression.split('')) {
      if (char == '(') open++;
      if (char == ')') open--;

      if (open < 0) {
        return false;
      }
    }

    return open == 0;
  }
}

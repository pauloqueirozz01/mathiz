class LogicClassifierService {
  static String classify(List<bool> results) {
    final allTrue = results.every((result) => result);

    final allFalse = results.every((result) => !result);

    if (allTrue) {
      return "Tautologia";
    }

    if (allFalse) {
      return "Contradição";
    }

    return "Contingência";
  }
}

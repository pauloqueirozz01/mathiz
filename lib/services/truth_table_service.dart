class TruthTableService {
  static List<Map<String, bool>> generateTable(List<String> variables) {
    final totalRows = 1 << variables.length;

    List<Map<String, bool>> rows = [];

    for (int i = 0; i < totalRows; i++) {
      Map<String, bool> row = {};

      for (int j = 0; j < variables.length; j++) {
        row[variables[j]] = ((i >> (variables.length - j - 1)) & 1) == 1;
      }

      rows.add(row);
    }

    return rows.reversed.toList();
  }
}

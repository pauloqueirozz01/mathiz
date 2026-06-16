class HistoryActivity {
  final String id;
  final String type;
  final String category;
  final String title;
  final String description;
  final String result;
  final DateTime createdAt;

  final Map<String, dynamic> metadata;

  HistoryActivity({
    required this.id,
    required this.type,
    required this.category,
    required this.title,
    required this.description,
    required this.result,
    required this.createdAt,
    required this.metadata,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "category": category,
      "title": title,
      "description": description,
      "result": result,
      "createdAt": createdAt.toIso8601String(),
      "metadata": metadata,
    };
  }

  factory HistoryActivity.fromMap(Map<String, dynamic> map) {
    return HistoryActivity(
      id: map["id"],
      type: map["type"],
      category: map["category"],
      title: map["title"],
      description: map["description"],
      result: map["result"],
      createdAt: DateTime.parse(map["createdAt"]),
      metadata: Map<String, dynamic>.from(map["metadata"] ?? {}),
    );
  }
}

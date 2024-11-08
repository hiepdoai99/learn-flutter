class Task {
  final num id;
  final String name;
  final String reporter;
  final String assignee;
  final String start_at;
  final String end_at;

  Task({
    required this.id,
    required this.name,
    required this.reporter,
    required this.assignee,
    required this.start_at,
    required this.end_at,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      reporter: json['reporter'],
      assignee: json['assignee'],
      start_at: json['start_at'],
      end_at: json['end_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'reporter': reporter,
      'assignee': assignee,
      'start_at': start_at,
      'end_at': end_at,
    };
  }
}

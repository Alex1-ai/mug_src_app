class Position {
  final int id;
  final String name;
  final String description;

  Position({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}

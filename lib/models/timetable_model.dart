class TimetableItemModel {
  final int id;
  final String name;
  final String timetableDoc;
  final String department;
  final DateTime updatedAt;

  TimetableItemModel({
    required this.id,
    required this.name,
    required this.timetableDoc,
    required this.department,
    required this.updatedAt,
  });

  factory TimetableItemModel.fromJson(Map<String, dynamic> json) {
    return TimetableItemModel(
      id: json['id'],
      name: json['name'],
      timetableDoc: json['timetableDoc'],
      department: json['department'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

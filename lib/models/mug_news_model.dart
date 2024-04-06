class MugNewsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String updatedAt;

  MugNewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.updatedAt,
  });

  // Factory constructor to create a MugNews object from a Map (JSON data)
  factory MugNewsModel.fromJson(Map<String, dynamic> json) {
    return MugNewsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  // Method to convert MugNews to a Map (for encoding to JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'updated_at': updatedAt,
    };
  }
}

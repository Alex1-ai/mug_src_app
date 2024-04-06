class CandidateModel {
  final int id;
  final String name;
  final String image;
  int votes;
  final String department;
  final String position;

  CandidateModel({
    required this.id,
    required this.name,
    required this.image,
    required this.votes,
    required this.department,
    required this.position,
  });
  bool selected = false;
  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      votes: json['votes'],
      department: json['department'],
      position: json['position'],
    );
  }
}
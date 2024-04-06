class PostalModel {
  int id;
  String posterImg;
  String updatedAt;

  PostalModel({
    required this.id,
    required this.posterImg,
    required this.updatedAt,
  });

  factory PostalModel.fromJson(Map<String, dynamic> json) {
    return PostalModel(
      id: json['id'],
      posterImg: json['poster_img'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'poster_img': posterImg,
      'updated_at': updatedAt,
    };
    return data;
  }
}

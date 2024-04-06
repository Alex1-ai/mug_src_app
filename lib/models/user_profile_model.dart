class UserProfileModel {
  String? email;
  String? name;
  String? course;
  String? level;
  String? phone;
  String? profileImage; // Added profileImage field

  UserProfileModel({
    required this.email,
    required this.name,
    required this.course,
    required this.level,
    required this.phone,
    required this.profileImage, // Added profileImage field
  });

  // Factory constructor to create a UserProfile object from a Map (Firestore document data)
  factory UserProfileModel.fromMap(Map<String, dynamic> data) {
    return UserProfileModel(
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      course: data['course'] ?? '',
      level: data['level'] ?? '',
      phone: data['phone'] ?? '',
      profileImage: data['profileImage'] ?? '', // Added profileImage field
    );
  }

  // Method to convert UserProfile to a Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'course': course,
      'level': level,
      'phone': phone,
      'profileImage': profileImage, // Added profileImage field
    };
  }

  // Method to serialize UserProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'course': course,
      'level': level,
      'phone': phone,
      'profileImage': profileImage,
    };
  }

  // Factory constructor to deserialize JSON into a UserProfileModel
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      course: json['course'] ?? '',
      level: json['level'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

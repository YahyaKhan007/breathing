class UserModel {
  String uid;
  String email;
  String name;
  String language;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.language,
  });

  // Convert a User object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'language': language,
    };
  }

  // Create a User object from a Map object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      language: map['language'] ?? '',
    );
  }
}

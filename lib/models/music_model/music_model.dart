import 'package:cloud_firestore/cloud_firestore.dart';

class Music {
  String id;
  String name;
  String picture;
  String file;

  Music({
    required this.id,
    required this.name,
    required this.picture,
    required this.file,
  });

  // Convert a Music object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'file': file,
    };
  }

  // Create a Music object from a Map object
  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      picture: map['picture'] ?? '',
      file: map['file'] ?? '',
    );
  }

  // Create a Music object from a Firestore document
  factory Music.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Music(
      id: doc.id,
      name: data['name'],
      picture: data['picture'],
      file: data['file'],
    );
  }
}

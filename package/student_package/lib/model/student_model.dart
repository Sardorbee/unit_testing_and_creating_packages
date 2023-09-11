class StudentModel {
  final int? id;
  final String name;
  final String course;
  final String imageUrl;
  final int age;
  final String address;

  StudentModel({
     this.id,
    required this.name,
    required this.course,
    required this.imageUrl,
    required this.age,
    required this.address,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      course: json['course'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      age: json['age'] ?? 0,
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'course': course,
      'imageUrl': imageUrl,
      'age': age,
      'address': address,
    };
  }

  StudentModel copyWith({
    int? id,
    String? name,
    String? course,
    String? imageUrl,
    int? age,
    String? address,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      course: course ?? this.course,
      imageUrl: imageUrl ?? this.imageUrl,
      age: age ?? this.age,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'StudentModel('
        'id: $id,'
        ' name: $name, '
        'course: $course, '
        'image: $imageUrl, '
        'age: $age, '
        'address: $address)';
  }
}

class StudentModelFields {
  static final String studentTable = 'students';
  static final String id = 'id';
  static final String name = 'name';
  static final String course = 'course';
  static final String imageUrl = 'imageUrl';
  static final String age = 'age';
  static final String address = 'address';
}

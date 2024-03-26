import 'dart:convert';

class UpdateUserModel {
  final String name;
  final int age;
  UpdateUserModel({
    required this.name,
    required this.age,
  });

  UpdateUserModel copyWith({
    String? name,
    int? age,
  }) {
    return UpdateUserModel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'age': age});
  
    return result;
  }

  factory UpdateUserModel.fromMap(Map<String, dynamic> map) {
    return UpdateUserModel(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateUserModel.fromJson(String source) => UpdateUserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UpdateUserModel(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpdateUserModel &&
      other.name == name &&
      other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String email;
  UserModel({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }
}

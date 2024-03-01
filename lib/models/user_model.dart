import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String uid;
  final String email;
  final String password;
  final String name;
  final String phoneNumber;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json["uid"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "password": password,
    "name": name,
    "phoneNumber": phoneNumber,
  };
}

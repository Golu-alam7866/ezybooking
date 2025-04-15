// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? name;
  String? nickname;
  String? dob;
  String? email;
  String? number;
  String? gender;
  String? profileImage;

  UserModel({
    this.id,
    this.name,
    this.nickname,
    this.dob,
    this.email,
    this.number,
    this.gender,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    nickname: json["nickname"],
    dob: json["dob"],
    email: json["email"],
    number: json["number"],
    gender: json["gender"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nickname": nickname,
    "dob": dob,
    "email": email,
    "number": number,
    "gender": gender,
    "profileImage": profileImage,
  };
}

// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  bool success;
  User user;
  String token;

  LoginResponseModel({
    required this.success,
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json["success"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String id;
  String name;
  String phone;
  String email;
  String password;
  int active;
  String otpCreatedAt;
  int lat;
  int long;
  String createdAt;
  String updatedAt;
  int v;
  String otp;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.active,
    required this.otpCreatedAt,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        active: json["active"],
        otpCreatedAt: json["otpCreatedAt"],
        lat: json["lat"],
        long: json["long"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "active": active,
        "otpCreatedAt": otpCreatedAt,
        "lat": lat,
        "long": long,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "otp": otp,
      };
}

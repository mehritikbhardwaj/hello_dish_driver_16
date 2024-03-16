// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  bool success;
  int todayCompleteCount;
  int totalCompleteCount;
  User user;

  ProfileResponse({
    required this.success,
    required this.user,
    required this.todayCompleteCount,
    required this.totalCompleteCount,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        success: json["success"],
        todayCompleteCount: json["todayCompleteCount"],
        totalCompleteCount: json["totalCompleteCount"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "todayCompleteCount": todayCompleteCount,
        "totalCompleteCount": totalCompleteCount,
        "user": user.toJson(),
      };
}

class User {
  String tshirtSize;
  String transactionId;
  String id;
  String name;
  String phone;
  String email;
  String profileImage;
  String password;
  int driverReview;
  int rating;
  int active;
  String dateOfBirth;
  String gender;
  int status;
  double lat;
  double long;
  int onlineOffline;
  String address;
  int vehicleType;
  String createdAt;
  String updatedAt;
  int v;

  User({
    required this.tshirtSize,
    required this.transactionId,
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.profileImage,
    required this.password,
    required this.driverReview,
    required this.rating,
    required this.active,
    required this.dateOfBirth,
    required this.gender,
    required this.status,
    required this.lat,
    required this.long,
    required this.onlineOffline,
    required this.address,
    required this.vehicleType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        tshirtSize: json["tshirtSize"],
        transactionId: json["transactionId"],
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        profileImage: json["profileImage"],
        password: json["password"],
        driverReview: json["driverReview"],
        rating: json["rating"],
        active: json["active"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        status: json["status"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        onlineOffline: json["onlineOffline"],
        address: json["address"],
        vehicleType: json["vehicleType"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "tshirtSize": tshirtSize,
        "transactionId": transactionId,
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "profileImage": profileImage,
        "password": password,
        "driverReview": driverReview,
        "rating": rating,
        "active": active,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "status": status,
        "lat": lat,
        "long": long,
        "onlineOffline": onlineOffline,
        "address": address,
        "vehicleType": vehicleType,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

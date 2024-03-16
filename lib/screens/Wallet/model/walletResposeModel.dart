// To parse this JSON data, do
//
//     final walletResponse = walletResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WalletResponse walletResponseFromJson(String str) =>
    WalletResponse.fromJson(json.decode(str));

String walletResponseToJson(WalletResponse data) => json.encode(data.toJson());

class WalletResponse {
  bool success;
  List<Datum> data;
  DriverWallet driverWallet;

  WalletResponse({
    required this.success,
    required this.data,
    required this.driverWallet,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        driverWallet: DriverWallet.fromJson(json["DriverWallet"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "DriverWallet": driverWallet.toJson(),
      };
}

class Datum {
  String id;
  String driverId;
  // dynamic orderId;
  int amount;
  String type;
  int active;
  String createdAt;
  String updatedAt;
  int v;

  Datum({
    required this.id,
    required this.driverId,
    // required this.orderId,
    required this.amount,
    required this.type,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        driverId: json["driverId"],
        //   orderId: json["orderId"],
        amount: json["amount"],
        type: json["type"],
        active: json["active"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "driverId": driverId,
        //   "orderId": orderId,
        "amount": amount,
        "type": type,
        "active": active,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class DriverWallet {
  String id;
  String driverId;
  int total;
  int totalWithdrawal;
  int totalEarn;
  int totalAdd;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  DriverWallet({
    required this.id,
    required this.driverId,
    required this.total,
    required this.totalWithdrawal,
    required this.totalEarn,
    required this.totalAdd,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DriverWallet.fromJson(Map<String, dynamic> json) => DriverWallet(
        id: json["_id"],
        driverId: json["driverId"],
        total: json["total"],
        totalWithdrawal: json["totalWithdrawal"],
        totalEarn: json["totalEarn"],
        totalAdd: json["totalAdd"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "driverId": driverId,
        "total": total,
        "totalWithdrawal": totalWithdrawal,
        "totalEarn": totalEarn,
        "totalAdd": totalAdd,
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

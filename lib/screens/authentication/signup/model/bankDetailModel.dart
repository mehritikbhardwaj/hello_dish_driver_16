// To parse this JSON data, do
//
//     final bankDetailModel = bankDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BankDetailModel bankDetailModelFromJson(String str) =>
    BankDetailModel.fromJson(json.decode(str));

String bankDetailModelToJson(BankDetailModel data) =>
    json.encode(data.toJson());

class BankDetailModel {
  String micr;
  String branch;
  String address;
  String state;
  String contact;
  bool upi;
  bool rtgs;
  String city;
  String centre;
  String district;
  bool neft;
  bool imps;
  dynamic swift;
  String iso3166;
  String bank;
  String bankcode;
  String ifsc;

  BankDetailModel({
    required this.micr,
    required this.branch,
    required this.address,
    required this.state,
    required this.contact,
    required this.upi,
    required this.rtgs,
    required this.city,
    required this.centre,
    required this.district,
    required this.neft,
    required this.imps,
    required this.swift,
    required this.iso3166,
    required this.bank,
    required this.bankcode,
    required this.ifsc,
  });

  factory BankDetailModel.fromJson(Map<String, dynamic> json) =>
      BankDetailModel(
        micr: json["MICR"],
        branch: json["BRANCH"],
        address: json["ADDRESS"],
        state: json["STATE"],
        contact: json["CONTACT"],
        upi: json["UPI"],
        rtgs: json["RTGS"],
        city: json["CITY"],
        centre: json["CENTRE"],
        district: json["DISTRICT"],
        neft: json["NEFT"],
        imps: json["IMPS"],
        swift: json["SWIFT"],
        iso3166: json["ISO3166"],
        bank: json["BANK"],
        bankcode: json["BANKCODE"],
        ifsc: json["IFSC"],
      );

  Map<String, dynamic> toJson() => {
        "MICR": micr,
        "BRANCH": branch,
        "ADDRESS": address,
        "STATE": state,
        "CONTACT": contact,
        "UPI": upi,
        "RTGS": rtgs,
        "CITY": city,
        "CENTRE": centre,
        "DISTRICT": district,
        "NEFT": neft,
        "IMPS": imps,
        "SWIFT": swift,
        "ISO3166": iso3166,
        "BANK": bank,
        "BANKCODE": bankcode,
        "IFSC": ifsc,
      };
}

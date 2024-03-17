// To parse this JSON data, do
//
//     final activeOrdersModel = activeOrdersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ActiveOrdersModel activeOrdersModelFromJson(String str) =>
    ActiveOrdersModel.fromJson(json.decode(str));

String activeOrdersModelToJson(ActiveOrdersModel data) =>
    json.encode(data.toJson());

class ActiveOrdersModel {
  bool status;
  List<DatumOrderActive> data;

  ActiveOrdersModel({
    required this.status,
    required this.data,
  });

  factory ActiveOrdersModel.fromJson(Map<String, dynamic> json) =>
      ActiveOrdersModel(
        status: json["status"],
        data: List<DatumOrderActive>.from(
            json["data"].map((x) => DatumOrderActive.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumOrderActive {
  Location location;
  String id;
  RestaurantId restaurantId;
  CustomerId customerId;
  CustomerLocationId customerLocationId;
  dynamic driverId;
  String offer;
  List<OrderItem> orderItems;
  int orderPrice;
  String paymentType;
  int foodPrepStatus;
  int driverAcceptStatus;
  int cancelStatus;
  int status;
  int discountAmount;
  double deliveryCharge;
  double gstCharge;
  double totalCost;
  int packingCharge;
  double lat;
  double long;
  int restaurnatRating;
  int driverRating;
  int rejectByRestaurant;
  int adminPaidToRestaurant;
  int adminPaidToDriver;
  String createdAt;
  String updatedAt;
  int v;

  DatumOrderActive({
    required this.location,
    required this.id,
    required this.restaurantId,
    required this.customerId,
    required this.customerLocationId,
    required this.driverId,
    required this.offer,
    required this.orderItems,
    required this.orderPrice,
    required this.paymentType,
    required this.foodPrepStatus,
    required this.driverAcceptStatus,
    required this.cancelStatus,
    required this.status,
    required this.discountAmount,
    required this.deliveryCharge,
    required this.gstCharge,
    required this.totalCost,
    required this.packingCharge,
    required this.lat,
    required this.long,
    required this.restaurnatRating,
    required this.driverRating,
    required this.rejectByRestaurant,
    required this.adminPaidToRestaurant,
    required this.adminPaidToDriver,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DatumOrderActive.fromJson(Map<String, dynamic> json) =>
      DatumOrderActive(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        restaurantId: RestaurantId.fromJson(json["restaurantId"]),
        customerId: CustomerId.fromJson(json["customerId"]),
        customerLocationId:
            CustomerLocationId.fromJson(json["customerLocationId"]),
        driverId: json["driverId"],
        offer: json["offer"],
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        orderPrice: json["orderPrice"],
        paymentType: json["paymentType"],
        foodPrepStatus: json["foodPrepStatus"],
        driverAcceptStatus: json["driverAcceptStatus"],
        cancelStatus: json["cancelStatus"],
        status: json["status"],
        discountAmount: json["discountAmount"],
        deliveryCharge: json["deliveryCharge"]?.toDouble(),
        gstCharge: json["gstCharge"],
        totalCost: json["totalCost"]?.toDouble(),
        packingCharge: json["packingCharge"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        restaurnatRating: json["restaurnatRating"],
        driverRating: json["driverRating"],
        rejectByRestaurant: json["rejectByRestaurant"],
        adminPaidToRestaurant: json["adminPaidToRestaurant"],
        adminPaidToDriver: json["adminPaidToDriver"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "restaurantId": restaurantId.toJson(),
        "customerId": customerId.toJson(),
        "customerLocationId": customerLocationId.toJson(),
        "driverId": driverId,
        "offer": offer,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "orderPrice": orderPrice,
        "paymentType": paymentType,
        "foodPrepStatus": foodPrepStatus,
        "driverAcceptStatus": driverAcceptStatus,
        "cancelStatus": cancelStatus,
        "status": status,
        "discountAmount": discountAmount,
        "deliveryCharge": deliveryCharge,
        "gstCharge": gstCharge.toDouble(),
        "totalCost": totalCost,
        "packingCharge": packingCharge,
        "lat": lat,
        "long": long,
        "restaurnatRating": restaurnatRating,
        "driverRating": driverRating,
        "rejectByRestaurant": rejectByRestaurant,
        "adminPaidToRestaurant": adminPaidToRestaurant,
        "adminPaidToDriver": adminPaidToDriver,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class CustomerId {
  String id;
  String name;
  String phone;
  String email;
  String password;
  int active;
  DateTime otpCreatedAt;
  double lat;
  double long;
  String createdAt;
  String updatedAt;
  int v;
  String otp;

  CustomerId({
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

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        active: json["active"],
        otpCreatedAt: DateTime.parse(json["otpCreatedAt"]),
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
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
        "otpCreatedAt": otpCreatedAt.toIso8601String(),
        "lat": lat,
        "long": long,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "otp": otp,
      };
}

class CustomerLocationId {
  String id;
  String customerId;
  String locationSaveAs;
  String houseNo;
  String area;
  String address;
  double lat;
  double long;
  String createdAt;
  String updatedAt;
  int v;

  CustomerLocationId({
    required this.id,
    required this.customerId,
    required this.locationSaveAs,
    required this.houseNo,
    required this.area,
    required this.address,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CustomerLocationId.fromJson(Map<String, dynamic> json) =>
      CustomerLocationId(
        id: json["_id"],
        customerId: json["customerId"],
        locationSaveAs: json["locationSaveAs"],
        houseNo: json["houseNo"],
        area: json["area"],
        address: json["address"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerId": customerId,
        "locationSaveAs": locationSaveAs,
        "houseNo": houseNo,
        "area": area,
        "address": address,
        "lat": lat,
        "long": long,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class OrderItem {
  String item;
  int quantity;
  String image;
  String price;

  OrderItem({
    required this.item,
    required this.quantity,
    required this.image,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        item: json["item"],
        quantity: json["quantity"],
        image: json["image"],
        price: json["price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "quantity": quantity,
        "image": image,
        "price": price,
      };
}

class RestaurantId {
  String profileImage;
  String id;
  String ownerName;
  String restaurantName;
  String restaurantAddress;
  double restaurantLat;
  double restaurantLong;
  String email;
  String phone;
  String password;
  int active;
  DateTime otpCreatedAt;
  int rating;
  String state;
  String city;
  int userType;
  int onlineOffline;
  int restaurantReview;
  String uniqueId;
  String createdAt;
  String updatedAt;
  int v;
  String otp;

  RestaurantId({
    required this.profileImage,
    required this.id,
    required this.ownerName,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.restaurantLat,
    required this.restaurantLong,
    required this.email,
    required this.phone,
    required this.password,
    required this.active,
    required this.otpCreatedAt,
    required this.rating,
    required this.state,
    required this.city,
    required this.userType,
    required this.onlineOffline,
    required this.restaurantReview,
    required this.uniqueId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
  });

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
        profileImage: json["profileImage"],
        id: json["_id"],
        ownerName: json["ownerName"],
        restaurantName: json["restaurantName"],
        restaurantAddress: json["restaurantAddress"],
        restaurantLat: json["restaurantLat"]?.toDouble(),
        restaurantLong: json["restaurantLong"]?.toDouble(),
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        active: json["active"],
        otpCreatedAt: DateTime.parse(json["otpCreatedAt"]),
        rating: json["rating"],
        state: json["state"],
        city: json["city"],
        userType: json["userType"],
        onlineOffline: json["onlineOffline"],
        restaurantReview: json["restaurantReview"],
        uniqueId: json["uniqueId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "profileImage": profileImage,
        "_id": id,
        "ownerName": ownerName,
        "restaurantName": restaurantName,
        "restaurantAddress": restaurantAddress,
        "restaurantLat": restaurantLat,
        "restaurantLong": restaurantLong,
        "email": email,
        "phone": phone,
        "password": password,
        "active": active,
        "otpCreatedAt": otpCreatedAt.toIso8601String(),
        "rating": rating,
        "state": state,
        "city": city,
        "userType": userType,
        "onlineOffline": onlineOffline,
        "restaurantReview": restaurantReview,
        "uniqueId": uniqueId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "otp": otp,
      };
}

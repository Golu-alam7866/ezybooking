// // To parse this JSON data, do
// //
// //     final bookingModel = bookingModelFromJson(jsonString);
//
// import 'dart:convert';
//
// BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));
//
// String bookingModelToJson(BookingModel data) => json.encode(data.toJson());
//
// class BookingModel {
//   String? userId;
//   String? hotelId;
//   String? roomId;
//   String? checkInDate;
//   String? checkOutDate;
//   int? totalPrice;
//   String? status;
//   String? paymentMethod;
//   List<dynamic>? guests;
//   String? createdAt;
//   String? updatedAt;
//
//   BookingModel({
//     this.userId,
//     this.hotelId,
//     this.roomId,
//     this.checkInDate,
//     this.checkOutDate,
//     this.totalPrice,
//     this.status,
//     this.paymentMethod,
//     this.guests,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
//     userId: json["userId"],
//     hotelId: json["hotelId"],
//     roomId: json["roomId"],
//     checkInDate: json["checkInDate"],
//     checkOutDate: json["checkOutDate"],
//     totalPrice: json["totalPrice"],
//     status: json["status"],
//     paymentMethod: json["paymentMethod"],
//     guests: json["guests"] == null ? [] : List<dynamic>.from(json["guests"]!.map((x) => x)),
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "hotelId": hotelId,
//     "roomId": roomId,
//     "checkInDate": checkInDate,
//     "checkOutDate": checkOutDate,
//     "totalPrice": totalPrice,
//     "status": status,
//     "paymentMethod": paymentMethod,
//     "guests": guests == null ? [] : List<dynamic>.from(guests!.map((x) => x)),
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//   };
// }


import 'dart:convert';

import 'package:ezybooking/models/rooms_model.dart';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  String? bookingId;
  String? userId;
  String? userName;
  String? hotelId;
  String? roomId;
  DateTime? checkIn;
  DateTime? checkOut;
  int? totalPrice;
  String? status;
  String? paymentStatus;
  String? paymentId;
  String? paymentMethod;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? bookedDates;
  String? totalRooms;
  String? totalGuest;
  String? totalDays;
  String? bookingStatus; // Ongoing, Completed, Cancelled
  RoomsModel? roomsModel;



  BookingModel({
    this.bookingId,
    this.userId,
    this.userName,
    this.hotelId,
    this.roomId,
    this.checkIn,
    this.checkOut,
    this.totalPrice,
    this.status,
    this.paymentStatus,
    this.paymentId,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.bookedDates,
    this.totalRooms,
    this.totalGuest,
    this.totalDays,
    this.bookingStatus,
    this.roomsModel
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    bookingId: json["bookingId"],
    userId: json["userId"],
    userName: json["userName"],
    hotelId: json["hotelId"],
    roomId: json["roomId"],
    checkIn: json["checkIn"] == null ? null : DateTime.parse(json["checkIn"]),
    checkOut: json["checkOut"] == null ? null : DateTime.parse(json["checkOut"]),
    totalPrice: json["totalPrice"],
    status: json["status"],
    paymentStatus: json["paymentStatus"],
    paymentId: json["paymentId"],
    paymentMethod: json["paymentMethod"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    // bookedDates: json["bookedDates"],
    bookedDates: (json["bookedDates"] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    totalRooms: json["totalRooms"],
    totalGuest: json["totalGuest"],
    totalDays: json["totalDays"],
    bookingStatus: json["bookingStatus"],
    roomsModel: json["roomsModel"] == null ? null : RoomsModel.fromJson(json["roomsModel"]),


  );

  Map<String, dynamic> toJson() => {
    "bookingId": bookingId,
    "userId": userId,
    "userName": userName,
    "hotelId": hotelId,
    "roomId": roomId,
    "checkIn": "${checkIn!.year.toString().padLeft(4, '0')}-${checkIn!.month.toString().padLeft(2, '0')}-${checkIn!.day.toString().padLeft(2, '0')}",
    "checkOut": "${checkOut!.year.toString().padLeft(4, '0')}-${checkOut!.month.toString().padLeft(2, '0')}-${checkOut!.day.toString().padLeft(2, '0')}",
    "totalPrice": totalPrice,
    "status": status,
    "paymentStatus": paymentStatus,
    "paymentId": paymentId,
    "paymentMethod": paymentMethod,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "bookedDates": bookedDates,
    "totalRooms": totalRooms,
    "totalGuest": totalGuest,
    "totalDays": totalDays,
    "bookingStatus": bookingStatus,
    "roomsModel": roomsModel?.toJson(),

  };
}



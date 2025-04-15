import 'dart:convert';

import 'hotels_model.dart';

RoomsModel roomsModelFromJson(String str) => RoomsModel.fromJson(json.decode(str));

String roomsModelToJson(RoomsModel data) => json.encode(data.toJson());

class RoomsModel {
  String? roomId;
  String? title;
  String? description;
  String? hotelOwnerId;
  String? hotelId;
  String? typeId;
  String? type;
  int? price;
  int? capacity;
  List<dynamic>? amenities;
  List<dynamic>? images;
  bool? available;
  HotelsModel? hotelModel;
  

  RoomsModel({
    this.roomId,
    this.title,
    this.description,
    this.hotelOwnerId,
    this.hotelId,
    this.typeId,
    this.type,
    this.price,
    this.capacity,
    this.amenities,
    this.images,
    this.available,
    this.hotelModel    
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
    roomId: json["roomId"],
    title: json["title"],
    description: json["description"],
    hotelOwnerId: json["hotelOwnerId"],
    hotelId: json["hotelId"],
    typeId: json["typeId"],
    type: json["type"],
    price: json["price"],
    capacity: json["capacity"],
    amenities: json["amenities"] == null ? [] : List<dynamic>.from(json["amenities"]!.map((x) => x)),
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    available: json["available"],
    hotelModel: json["hotelModel"] == null ? null : HotelsModel.fromJson(json["hotelModel"]),
  );

  Map<String, dynamic> toJson() => {
    "roomId": roomId,
    "hotelOwnerId": hotelOwnerId,
    "hotelId": hotelId,
    "typeId": typeId,
    "type": type,
    "price": price,
    "capacity": capacity,
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x)),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "available": available,
    "hotelModel": hotelModel?.toJson(),
  };
}

/// Hotel

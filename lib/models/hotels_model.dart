import 'dart:convert';

HotelsModel hotelsModelFromJson(String str) => HotelsModel.fromJson(json.decode(str));

String hotelsModelToJson(HotelsModel data) => json.encode(data.toJson());

class HotelsModel {
  String? hotelId;
  String? hotelName;
  String? hotelDescription;
  HotelAddress? hotelAddress;
  List<dynamic>? amenities;
  List<dynamic>? images;
  int? rating;
  int? totalReviews;
  String? ownerId;
  String? createdAt;
  String? updatedAt;
  String? hotelCity;
  String? cityId;

  HotelsModel({
    this.hotelId,
    this.hotelName,
    this.hotelDescription,
    this.hotelAddress,
    this.amenities,
    this.images,
    this.rating,
    this.totalReviews,
    this.ownerId,
    this.createdAt,
    this.updatedAt,
    this.hotelCity,
    this.cityId,
  });

  factory HotelsModel.fromJson(Map<String, dynamic> json) => HotelsModel(
    hotelId: json["hotelId"],
    hotelName: json["hotelName"],
    hotelDescription: json["hotelDescription"],
    hotelAddress: json["hotelAddress"] == null ? null : HotelAddress.fromJson(json["hotelAddress"]),
    amenities: json["amenities"] == null ? [] : List<dynamic>.from(json["amenities"]!.map((x) => x)),
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    rating: json["rating"],
    totalReviews: json["totalReviews"],
    ownerId: json["ownerId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    hotelCity: json["hotelCity"],
    cityId: json["cityId"],
  );

  Map<String, dynamic> toJson() => {
    "hotelId": hotelId,
    "hotelName": hotelName,
    "hotelDescription": hotelDescription,
    "hotelAddress": hotelAddress?.toJson(),
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x)),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "rating": rating,
    "totalReviews": totalReviews,
    "ownerId": ownerId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "hotelCity": hotelCity,
    "cityId": cityId,
  };
}

class HotelAddress {
  String? street;
  String? city;
  String? state;
  String? country;
  Coordinates? coordinates;

  HotelAddress({
    this.street,
    this.city,
    this.state,
    this.country,
    this.coordinates,
  });

  factory HotelAddress.fromJson(Map<String, dynamic> json) => HotelAddress(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "country": country,
    "coordinates": coordinates?.toJson(),
  };
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

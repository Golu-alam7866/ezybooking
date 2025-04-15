// To parse this JSON data, do
//
//     final reviewsModel = reviewsModelFromJson(jsonString);

import 'dart:convert';

ReviewsModel reviewsModelFromJson(String str) => ReviewsModel.fromJson(json.decode(str));

String reviewsModelToJson(ReviewsModel data) => json.encode(data.toJson());

class ReviewsModel {
  String? userId;
  String? hotelId;
  String? bookingId;
  int? rating;
  String? comment;
  String? createdAt;

  ReviewsModel({
    this.userId,
    this.hotelId,
    this.bookingId,
    this.rating,
    this.comment,
    this.createdAt,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
    userId: json["userId"],
    hotelId: json["hotelId"],
    bookingId: json["bookingId"],
    rating: json["rating"],
    comment: json["comment"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "hotelId": hotelId,
    "bookingId": bookingId,
    "rating": rating,
    "comment": comment,
    "createdAt": createdAt,
  };
}

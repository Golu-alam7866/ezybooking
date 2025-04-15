// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  String? userId;
  String? bookingId;
  int? amount;
  String? currency;
  String? status;
  String? createdAt;

  PaymentModel({
    this.userId,
    this.bookingId,
    this.amount,
    this.currency,
    this.status,
    this.createdAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    userId: json["userId"],
    bookingId: json["bookingId"],
    amount: json["amount"],
    currency: json["currency"],
    status: json["status"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "bookingId": bookingId,
    "amount": amount,
    "currency": currency,
    "status": status,
    "createdAt": createdAt,
  };
}

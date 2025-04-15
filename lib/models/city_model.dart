import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  String? id;
  String? cityName;
  String? cityImage;

  CityModel({
    this.id,
    this.cityName,
    this.cityImage,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    cityName: json["cityName"],
    cityImage: json["cityImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cityName": cityName,
    "cityImage": cityImage,
  };
}

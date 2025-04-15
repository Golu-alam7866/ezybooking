import 'dart:convert';

AddRoomsTypesModel addRoomsTypesModelFromJson(String str) => AddRoomsTypesModel.fromJson(json.decode(str));

String addRoomsTypesModelToJson(AddRoomsTypesModel data) => json.encode(data.toJson());

class AddRoomsTypesModel {
  String? id;
  String? roomType;

  AddRoomsTypesModel({
    this.id,
    this.roomType,
  });

  factory AddRoomsTypesModel.fromJson(Map<String, dynamic> json) => AddRoomsTypesModel(
    id: json["id"],
    roomType: json["roomType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "roomType": roomType,
  };
}

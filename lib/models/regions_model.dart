// To parse this JSON data, do
//
//     final regionsModel = regionsModelFromJson(jsonString);

import 'dart:convert';

RegionsModel regionsModelFromJson(List<int> str) =>
    RegionsModel.fromJson(json.decode(utf8.decode(str)));

String regionsModelToJson(RegionsModel data) => json.encode(data.toJson());

class RegionsModel {
  RegionsModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory RegionsModel.fromJson(Map<String, dynamic> json) => RegionsModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.ab,
    this.name,
  });

  String id;
  String ab;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        ab: json["ab"] == null ? null : json["ab"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ab": ab == null ? null : ab,
        "name": name == null ? null : name,
      };
}

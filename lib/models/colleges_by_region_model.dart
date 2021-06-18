// To parse this JSON data, do
//
//     final collegesByRegionModel = collegesByRegionModelFromJson(jsonString);

import 'dart:convert';

CollegesByRegionModel collegesByRegionModelFromJson(List<int> str) =>
    CollegesByRegionModel.fromJson(json.decode(utf8.decode(str)));

String collegesByRegionModelToJson(CollegesByRegionModel data) =>
    json.encode(data.toJson());

class CollegesByRegionModel {
  CollegesByRegionModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory CollegesByRegionModel.fromJson(Map<String, dynamic> json) =>
      CollegesByRegionModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.list,
  });

  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.bin,
    this.name,
    this.address,
    this.phoneNumber,
    this.ownershipName,
  });

  String bin;
  String name;
  String address;
  String phoneNumber;
  String ownershipName;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        bin: json["bin"] == null ? null : json["bin"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        ownershipName:
            json["ownership_name"] == null ? null : json["ownership_name"],
      );

  Map<String, dynamic> toJson() => {
        "bin": bin == null ? null : bin,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "ownership_name": ownershipName == null ? null : ownershipName,
      };
}

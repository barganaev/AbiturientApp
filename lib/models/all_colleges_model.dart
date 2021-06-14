// To parse this JSON data, do
//
//     final allCollegesModel = allCollegesModelFromJson(jsonString);

import 'dart:convert';

AllCollegesModel allCollegesModelFromJson(String str) =>
    AllCollegesModel.fromJson(json.decode(str));

String allCollegesModelToJson(AllCollegesModel data) =>
    json.encode(data.toJson());

class AllCollegesModel {
  AllCollegesModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory AllCollegesModel.fromJson(Map<String, dynamic> json) =>
      AllCollegesModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.list,
  });

  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.name,
    this.address,
    this.phoneNumber,
    this.regionName,
    this.ownershipName,
  });

  String name;
  String address;
  String phoneNumber;
  String regionName;
  String ownershipName;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        regionName: json["region_name"],
        ownershipName: json["ownership_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "region_name": regionName,
        "ownership_name": ownershipName,
      };
}

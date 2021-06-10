// To parse this JSON data, do
//
//     final myOrdersModel = myOrdersModelFromJson(jsonString);

import 'dart:convert';

MyOrdersModel myOrdersModelFromJson(String str) =>
    MyOrdersModel.fromJson(json.decode(str));

String myOrdersModelToJson(MyOrdersModel data) => json.encode(data.toJson());

class MyOrdersModel {
  MyOrdersModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
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
    this.block,
  });

  Block block;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        block: Block.fromJson(json["block"]),
      );

  Map<String, dynamic> toJson() => {
        "block": block.toJson(),
      };
}

class Block {
  Block({
    this.mainInfo,
  });

  MainInfo mainInfo;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        mainInfo: MainInfo.fromJson(json["main_info"]),
      );

  Map<String, dynamic> toJson() => {
        "main_info": mainInfo.toJson(),
      };
}

class MainInfo {
  MainInfo({
    this.name,
    this.values,
  });

  String name;
  Values values;

  factory MainInfo.fromJson(Map<String, dynamic> json) => MainInfo(
        name: json["name"],
        values: Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "values": values.toJson(),
      };
}

class Values {
  Values({
    this.citizenStatus,
  });

  CitizenStatus citizenStatus;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        citizenStatus: CitizenStatus.fromJson(json["citizen_status"]),
      );

  Map<String, dynamic> toJson() => {
        "citizen_status": citizenStatus.toJson(),
      };
}

class CitizenStatus {
  CitizenStatus({
    this.type,
    this.name,
    this.value,
  });

  String type;
  String name;
  String value;

  factory CitizenStatus.fromJson(Map<String, dynamic> json) => CitizenStatus(
        type: json["type"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "value": value,
      };
}

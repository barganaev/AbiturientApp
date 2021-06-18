// To parse this JSON data, do
//
//     final myOrdersModel = myOrdersModelFromJson(jsonString);

import 'dart:convert';

MyOrdersModel myOrdersModelFromJson(List<int> str) =>
    MyOrdersModel.fromJson(json.decode(utf8.decode(str)));

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
    this.requestList,
  });

  RequestList requestList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        requestList: RequestList.fromJson(json["requestList"]),
      );

  Map<String, dynamic> toJson() => {
        "requestList": requestList.toJson(),
      };
}

class RequestList {
  RequestList({
    this.headers,
    this.list,
  });

  List<Header> headers;
  List<ListElementt> list;

  factory RequestList.fromJson(Map<String, dynamic> json) => RequestList(
        headers:
            List<Header>.from(json["headers"].map((x) => Header.fromJson(x))),
        list: List<ListElementt>.from(
            json["list"].map((x) => ListElementt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "headers": List<dynamic>.from(headers.map((x) => x.toJson())),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    this.text,
    this.value,
  });

  String text;
  String value;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}

class ListElementt {
  ListElementt({
    this.id,
    this.iin,
    this.fullName,
    this.birthday,
    this.graduationYear,
    this.email,
    this.phoneNumber,
    this.parentPhoneNumber,
    this.isHaveQuota,
    this.choosedQualificationCount,
    this.createdAt,
    this.regionName,
    this.statusName,
    this.statusType,
  });

  String id;
  String iin;
  String fullName;
  String birthday;
  String graduationYear;
  String email;
  String phoneNumber;
  String parentPhoneNumber;
  bool isHaveQuota;
  String choosedQualificationCount;
  String createdAt;
  String regionName;
  String statusName;
  String statusType;

  factory ListElementt.fromJson(Map<String, dynamic> json) => ListElementt(
        id: json["id"],
        iin: json["iin"],
        fullName: json["full_name"],
        birthday: json["birthday"],
        graduationYear: json["graduation_year"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        parentPhoneNumber: json["parent_phone_number"],
        isHaveQuota: json["is_have_quota"],
        choosedQualificationCount: json["choosed_qualification_count"],
        createdAt: json["created_at"],
        regionName: json["region_name"],
        statusName: json["status_name"],
        statusType: json["status_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iin": iin,
        "full_name": fullName,
        "birthday": birthday,
        "graduation_year": graduationYear,
        "email": email,
        "phone_number": phoneNumber,
        "parent_phone_number": parentPhoneNumber,
        "is_have_quota": isHaveQuota,
        "choosed_qualification_count": choosedQualificationCount,
        "created_at": createdAt,
        "region_name": regionName,
        "status_name": statusName,
        "status_type": statusType,
      };
}

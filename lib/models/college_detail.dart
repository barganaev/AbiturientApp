// To parse this JSON data, do
//
//     final collegeDetailModel = collegeDetailModelFromJson(jsonString);

import 'dart:convert';

// CollegeDetailModel collegeDetailModelFromJson(String str) => CollegeDetailModel.fromJson(json.decode(str));
CollegeDetailModel collegeDetailModelFromJson(List<int> str) => CollegeDetailModel.fromJson(json.decode(utf8.decode(str)));

String collegeDetailModelToJson(CollegeDetailModel data) => json.encode(data.toJson());

class CollegeDetailModel {
  CollegeDetailModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory CollegeDetailModel.fromJson(Map<String, dynamic> json) => CollegeDetailModel(
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
    this.text,
    this.value,
    this.type,
    this.content,
  });

  String text;
  String value;
  String type;
  Content content;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    text: json["text"],
    value: json["value"],
    type: json["type"],
    content: Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "value": value,
    "type": type,
    "content": content.toJson(),
  };
}

class Content {
  Content({
    this.generalInformation,
    this.collegeData,
    this.specialties,
  });

  GeneralInformation generalInformation;
  CollegeData collegeData;
  Specialties specialties;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    generalInformation: GeneralInformation.fromJson(json["general_information"]),
    collegeData: CollegeData.fromJson(json["college_data"]),
    specialties: Specialties.fromJson(json["specialties"]),
  );

  Map<String, dynamic> toJson() => {
    "general_information": generalInformation.toJson(),
    "college_data": collegeData.toJson(),
    "specialties": specialties.toJson(),
  };
}

class CollegeData {
  CollegeData({
    this.type,
    this.name,
    this.values,
  });

  String type;
  String name;
  Values values;

  factory CollegeData.fromJson(Map<String, dynamic> json) => CollegeData(
    type: json["type"],
    name: json["name"],
    values: Values.fromJson(json["values"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "values": values.toJson(),
  };
}

class Values {
  Values({
    this.regionName,
    this.name,
    this.orgTypeName,
    this.ownershipTypeName,
    this.address,
    this.phoneNumber,
    this.email,
    this.siteUrl,
    this.directorFullname,
  });

  Address regionName;
  Address name;
  Address orgTypeName;
  Address ownershipTypeName;
  Address address;
  Address phoneNumber;
  Address email;
  Address siteUrl;
  Address directorFullname;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
    regionName: Address.fromJson(json["region_name"]),
    name: Address.fromJson(json["name"]),
    orgTypeName: Address.fromJson(json["org_type_name"]),
    ownershipTypeName: Address.fromJson(json["ownership_type_name"]),
    address: Address.fromJson(json["address"]),
    phoneNumber: Address.fromJson(json["phone_number"]),
    email: Address.fromJson(json["email"]),
    siteUrl: Address.fromJson(json["site_url"]),
    directorFullname: Address.fromJson(json["director_fullname"]),
  );

  Map<String, dynamic> toJson() => {
    "region_name": regionName.toJson(),
    "name": name.toJson(),
    "org_type_name": orgTypeName.toJson(),
    "ownership_type_name": ownershipTypeName.toJson(),
    "address": address.toJson(),
    "phone_number": phoneNumber.toJson(),
    "email": email.toJson(),
    "site_url": siteUrl.toJson(),
    "director_fullname": directorFullname.toJson(),
  };
}

class Address {
  Address({
    this.name,
    this.value,
    this.type,
  });

  String name;
  String value;
  String type;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    name: json["name"],
    value: json["value"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
    "type": type,
  };
}

class GeneralInformation {
  GeneralInformation({
    this.type,
    this.data,
  });

  String type;
  String data;

  factory GeneralInformation.fromJson(Map<String, dynamic> json) => GeneralInformation(
    type: json["type"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": data,
  };
}

class Specialties {
  Specialties({
    this.type,
    this.data,
  });

  String type;
  List<Datum> data;

  factory Specialties.fromJson(Map<String, dynamic> json) => Specialties(
    type: json["type"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.qualificationCode,
    this.specialtyCode,
    this.name,
  });

  String qualificationCode;
  String specialtyCode;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    qualificationCode: json["qualification_code"],
    specialtyCode: json["specialty_code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "qualification_code": qualificationCode,
    "specialty_code": specialtyCode,
    "name": name,
  };
}

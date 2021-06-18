// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.iin,
    this.surname,
    this.name,
    this.lastname,
    this.email,
    this.birthDate,
    this.gender,
  });

  String iin;
  String surname;
  String name;
  String lastname;
  dynamic email;
  dynamic birthDate;
  String gender;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        iin: json["iin"] == null ? null : json["iin"],
        surname: json["surname"] == null ? null : json["surname"],
        name: json["name"] == null ? null : json["name"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        email: json["email"],
        birthDate: json["birthDate"],
        gender: json["gender"] == null ? null : json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "iin": iin == null ? null : iin,
        "surname": surname == null ? null : surname,
        "name": name == null ? null : name,
        "lastname": lastname == null ? null : lastname,
        "email": email,
        "birthDate": birthDate,
        "gender": gender == null ? null : gender,
      };
}

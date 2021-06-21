// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(List<int> str) => NewsModel.fromJson(json.decode(utf8.decode(str)));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
    this.count,
    this.pages,
    this.body,
  });

  String count;
  int pages;
  List<Body> body;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"],
    pages: json["pages"],
    body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "body": List<dynamic>.from(body.map((x) => x.toJson())),
  };
}

class Body {
  Body({
    this.lang,
    this.bin,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  String lang;
  String bin;
  String title;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> image;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    lang: json["lang"],
    bin: json["bin"],
    title: json["title"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: List<String>.from(json["image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
    "bin": bin,
    "title": title,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}








// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// NewsModel newsModelFromJson(List<int> str) =>
//     NewsModel.fromJson(json.decode(utf8.decode(str)));
//
// String newsModelToJson(NewsModel data) => json.encode(data.toJson());
//
// class NewsModel {
//   NewsModel({
//     this.status,
//     this.data,
//   });
//
//   String status;
//   Data data;
//
//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//         status: json["status"] == null ? null : json["status"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status == null ? null : status,
//         "data": data == null ? null : data.toJson(),
//       };
// }
//
// class Data {
//   Data({
//     this.count,
//     this.pages,
//     this.body,
//   });
//
//   String count;
//   int pages;
//   List<Body> body;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         count: json["count"] == null ? null : json["count"],
//         pages: json["pages"] == null ? null : json["pages"],
//         body: json["body"] == null
//             ? null
//             : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "count": count == null ? null : count,
//         "pages": pages == null ? null : pages,
//         "body": body == null
//             ? null
//             : List<dynamic>.from(body.map((x) => x.toJson())),
//       };
// }
//
// class Body {
//   Body({
//     this.lang,
//     this.bin,
//     this.title,
//     this.body,
//     this.img,
//   });
//
//   String lang;
//   String bin;
//   String title;
//   String body;
//   String img;
//
//   factory Body.fromJson(Map<String, dynamic> json) => Body(
//         lang: json["lang"] == null ? null : json["lang"],
//         bin: json["bin"] == null ? null : json["bin"],
//         title: json["title"] == null ? null : json["title"],
//         body: json["body"] == null ? null : json["body"],
//         img: json["img"] == null ? null : json["img"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "lang": lang == null ? null : lang,
//         "bin": bin == null ? null : bin,
//         "title": title == null ? null : title,
//         "body": body == null ? null : body,
//         "img": img == null ? null : img,
//       };
// }

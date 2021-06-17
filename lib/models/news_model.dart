// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(List<int> str) =>
    NewsModel.fromJson(json.decode(utf8.decode(str)));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
    this.count,
    this.pages,
    this.body,
  });

  String count;
  int pages;
  List<Body> body;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"] == null ? null : json["count"],
        pages: json["pages"] == null ? null : json["pages"],
        body: json["body"] == null
            ? null
            : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "pages": pages == null ? null : pages,
        "body": body == null
            ? null
            : List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    this.lang,
    this.bin,
    this.title,
    this.body,
    this.img,
  });

  String lang;
  String bin;
  String title;
  String body;
  String img;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        lang: json["lang"] == null ? null : json["lang"],
        bin: json["bin"] == null ? null : json["bin"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        img: json["img"] == null ? null : json["img"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang == null ? null : lang,
        "bin": bin == null ? null : bin,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "img": img == null ? null : img,
      };
}

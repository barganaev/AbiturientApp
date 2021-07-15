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

  NewsModel copyWith({
    String status,
    Data data,
  }) =>
      NewsModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

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

  Data copyWith({
    String count,
    int pages,
    List<Body> body,
  }) =>
      Data(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        body: body ?? this.body,
      );

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
    this.id,
    this.lang,
    this.bin,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  String id;
  String lang;
  String bin;
  String title;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> image;

  Body copyWith({
    String id,
    String lang,
    String bin,
    String title,
    String body,
    DateTime createdAt,
    DateTime updatedAt,
    List<String> image,
  }) =>
      Body(
        id: id ?? this.id,
        lang: lang ?? this.lang,
        bin: bin ?? this.bin,
        title: title ?? this.title,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        image: image ?? this.image,
      );

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        lang: json["lang"],
        bin: json["bin"],
        title: json["title"],
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lang": lang,
        "bin": bin,
        "title": title,
        "body": body,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "image": List<dynamic>.from(image.map((x) => x)),
      };
}

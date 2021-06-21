// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(List<int> str) =>
    FaqModel.fromJson(json.decode(utf8.decode(str)));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
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
    this.question,
    this.answer,
  });

  String question;
  String answer;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        question: json["question"] == null ? null : json["question"],
        answer: json["answer"] == null ? null : json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question == null ? null : question,
        "answer": answer == null ? null : answer,
      };
}

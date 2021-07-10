import 'dart:convert';

DetailOrderModel detailOrderModelFromJson(List<int> str) =>
    DetailOrderModel.fromJson(json.decode(utf8.decode(str)));

String detailOrderModelToJson(DetailOrderModel data) =>
    json.encode(data.toJson());

class DetailOrderModel {
  DetailOrderModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DetailOrderModel.fromJson(Map<String, dynamic> json) =>
      DetailOrderModel(
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



// To parse this JSON data, do
//
//     final detailOrderModel = detailOrderModelFromJson(jsonString);

// import 'dart:convert';
//
// DetailOrderModel detailOrderModelFromJson(String str) => DetailOrderModel.fromJson(json.decode(str));
//
// String detailOrderModelToJson(DetailOrderModel data) => json.encode(data.toJson());
//
// class DetailOrderModel {
//   DetailOrderModel({
//     this.status,
//     this.data,
//   });
//
//   String status;
//   Data data;
//
//   factory DetailOrderModel.fromJson(Map<String, dynamic> json) => DetailOrderModel(
//     status: json["status"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.block,
//     this.info,
//   });
//
//   Block block;
//   Info info;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     block: Block.fromJson(json["block"]),
//     info: Info.fromJson(json["info"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "block": block.toJson(),
//     "info": info.toJson(),
//   };
// }
//
// class Block {
//   Block({
//     this.mainInfo,
//     this.contactInfo,
//     this.educationInfo,
//     this.quotaInfo,
//     this.qualificationInfo1,
//     this.qualificationInfo2,
//   });
//
//   MainInfo mainInfo;
//   ContactInfo contactInfo;
//   EducationInfo educationInfo;
//   QuotaInfo quotaInfo;
//   QualificationInfo qualificationInfo1;
//   QualificationInfo qualificationInfo2;
//
//   factory Block.fromJson(Map<String, dynamic> json) => Block(
//     mainInfo: MainInfo.fromJson(json["main_info"]),
//     contactInfo: ContactInfo.fromJson(json["contact_info"]),
//     educationInfo: EducationInfo.fromJson(json["education_info"]),
//     quotaInfo: QuotaInfo.fromJson(json["quota_info"]),
//     qualificationInfo1: QualificationInfo.fromJson(json["qualification_info_1"]),
//     qualificationInfo2: QualificationInfo.fromJson(json["qualification_info_2"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "main_info": mainInfo.toJson(),
//     "contact_info": contactInfo.toJson(),
//     "education_info": educationInfo.toJson(),
//     "quota_info": quotaInfo.toJson(),
//     "qualification_info_1": qualificationInfo1.toJson(),
//     "qualification_info_2": qualificationInfo2.toJson(),
//   };
// }
//
// class ContactInfo {
//   ContactInfo({
//     this.name,
//     this.values,
//   });
//
//   String name;
//   ContactInfoValues values;
//
//   factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
//     name: json["name"],
//     values: ContactInfoValues.fromJson(json["values"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "values": values.toJson(),
//   };
// }
//
// class ContactInfoValues {
//   ContactInfoValues({
//     this.email,
//     this.phoneNumber,
//     this.parentPhoneNumber,
//   });
//
//   FromSite email;
//   FromSite phoneNumber;
//   FromSite parentPhoneNumber;
//
//   factory ContactInfoValues.fromJson(Map<String, dynamic> json) => ContactInfoValues(
//     email: FromSite.fromJson(json["email"]),
//     phoneNumber: FromSite.fromJson(json["phone_number"]),
//     parentPhoneNumber: FromSite.fromJson(json["parent_phone_number"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "email": email.toJson(),
//     "phone_number": phoneNumber.toJson(),
//     "parent_phone_number": parentPhoneNumber.toJson(),
//   };
// }
//
// class FromSite {
//   FromSite({
//     this.type,
//     this.name,
//     this.value,
//   });
//
//   Type type;
//   String name;
//   String value;
//
//   factory FromSite.fromJson(Map<String, dynamic> json) => FromSite(
//     type: typeValues.map[json["type"]],
//     name: json["name"],
//     value: json["value"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": typeValues.reverse[type],
//     "name": name,
//     "value": value,
//   };
// }
//
// enum Type { EMAIL, TEL, STRING }
//
// final typeValues = EnumValues({
//   "email": Type.EMAIL,
//   "string": Type.STRING,
//   "tel": Type.TEL
// });
//
// class EducationInfo {
//   EducationInfo({
//     this.name,
//     this.values,
//   });
//
//   String name;
//   EducationInfoValues values;
//
//   factory EducationInfo.fromJson(Map<String, dynamic> json) => EducationInfo(
//     name: json["name"],
//     values: EducationInfoValues.fromJson(json["values"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "values": values.toJson(),
//   };
// }
//
// class EducationInfoValues {
//   EducationInfoValues({
//     this.educationType,
//     this.educationDocumentTypeName,
//     this.educationDocument,
//     this.schoolCountryName,
//     this.schoolRegionName,
//     this.schoolName,
//     this.graduationYear,
//   });
//
//   FromSite educationType;
//   FromSite educationDocumentTypeName;
//   Document educationDocument;
//   FromSite schoolCountryName;
//   FromSite schoolRegionName;
//   FromSite schoolName;
//   FromSite graduationYear;
//
//   factory EducationInfoValues.fromJson(Map<String, dynamic> json) => EducationInfoValues(
//     educationType: FromSite.fromJson(json["education_type"]),
//     educationDocumentTypeName: FromSite.fromJson(json["education_document_type_name"]),
//     educationDocument: Document.fromJson(json["education_document"]),
//     schoolCountryName: FromSite.fromJson(json["school_country_name"]),
//     schoolRegionName: FromSite.fromJson(json["school_region_name"]),
//     schoolName: FromSite.fromJson(json["school_name"]),
//     graduationYear: FromSite.fromJson(json["graduation_year"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "education_type": educationType.toJson(),
//     "education_document_type_name": educationDocumentTypeName.toJson(),
//     "education_document": educationDocument.toJson(),
//     "school_country_name": schoolCountryName.toJson(),
//     "school_region_name": schoolRegionName.toJson(),
//     "school_name": schoolName.toJson(),
//     "graduation_year": graduationYear.toJson(),
//   };
// }
//
// class Document {
//   Document({
//     this.type,
//     this.name,
//     this.value,
//     this.sizeB,
//     this.fileName,
//   });
//
//   String type;
//   String name;
//   String value;
//   String sizeB;
//   String fileName;
//
//   factory Document.fromJson(Map<String, dynamic> json) => Document(
//     type: json["type"],
//     name: json["name"],
//     value: json["value"],
//     sizeB: json["size_b"],
//     fileName: json["file_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "name": name,
//     "value": value,
//     "size_b": sizeB,
//     "file_name": fileName,
//   };
// }
//
// class MainInfo {
//   MainInfo({
//     this.name,
//     this.values,
//   });
//
//   String name;
//   MainInfoValues values;
//
//   factory MainInfo.fromJson(Map<String, dynamic> json) => MainInfo(
//     name: json["name"],
//     values: MainInfoValues.fromJson(json["values"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "values": values.toJson(),
//   };
// }
//
// class MainInfoValues {
//   MainInfoValues({
//     this.iin,
//     this.fullName,
//     this.birthday,
//     this.nationality,
//     this.citizen,
//   });
//
//   FromSite iin;
//   FromSite fullName;
//   FromSite birthday;
//   FromSite nationality;
//   FromSite citizen;
//
//   factory MainInfoValues.fromJson(Map<String, dynamic> json) => MainInfoValues(
//     iin: FromSite.fromJson(json["iin"]),
//     fullName: FromSite.fromJson(json["full_name"]),
//     birthday: FromSite.fromJson(json["birthday"]),
//     nationality: FromSite.fromJson(json["nationality"]),
//     citizen: FromSite.fromJson(json["citizen"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "iin": iin.toJson(),
//     "full_name": fullName.toJson(),
//     "birthday": birthday.toJson(),
//     "nationality": nationality.toJson(),
//     "citizen": citizen.toJson(),
//   };
// }
//
// class QualificationInfo {
//   QualificationInfo({
//     this.name,
//     this.values,
//   });
//
//   String name;
//   QualificationInfo1Values values;
//
//   factory QualificationInfo.fromJson(Map<String, dynamic> json) => QualificationInfo(
//     name: json["name"],
//     values: QualificationInfo1Values.fromJson(json["values"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "values": values.toJson(),
//   };
// }
//
// class QualificationInfo1Values {
//   QualificationInfo1Values({
//     this.qualificationName,
//     this.qualificationCode,
//     this.collegeName,
//     this.collegeBin,
//     this.statusNameQualification,
//     this.langStudy,
//   });
//
//   FromSite qualificationName;
//   FromSite qualificationCode;
//   FromSite collegeName;
//   FromSite collegeBin;
//   FromSite statusNameQualification;
//   FromSite langStudy;
//
//   factory QualificationInfo1Values.fromJson(Map<String, dynamic> json) => QualificationInfo1Values(
//     qualificationName: FromSite.fromJson(json["qualification_name"]),
//     qualificationCode: FromSite.fromJson(json["qualification_code"]),
//     collegeName: FromSite.fromJson(json["college_name"]),
//     collegeBin: FromSite.fromJson(json["college_bin"]),
//     statusNameQualification: FromSite.fromJson(json["status_name_qualification"]),
//     langStudy: FromSite.fromJson(json["lang_study"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "qualification_name": qualificationName.toJson(),
//     "qualification_code": qualificationCode.toJson(),
//     "college_name": collegeName.toJson(),
//     "college_bin": collegeBin.toJson(),
//     "status_name_qualification": statusNameQualification.toJson(),
//     "lang_study": langStudy.toJson(),
//   };
// }
//
// class QuotaInfo {
//   QuotaInfo({
//     this.name,
//     this.values,
//   });
//
//   String name;
//   QuotaInfoValues values;
//
//   factory QuotaInfo.fromJson(Map<String, dynamic> json) => QuotaInfo(
//     name: json["name"],
//     values: QuotaInfoValues.fromJson(json["values"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "values": values.toJson(),
//   };
// }
//
// class QuotaInfoValues {
//   QuotaInfoValues({
//     this.quotaTypeName,
//     this.quotaDocument,
//   });
//
//   FromSite quotaTypeName;
//   Document quotaDocument;
//
//   factory QuotaInfoValues.fromJson(Map<String, dynamic> json) => QuotaInfoValues(
//     quotaTypeName: FromSite.fromJson(json["quota_type_name"]),
//     quotaDocument: Document.fromJson(json["quota_document"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "quota_type_name": quotaTypeName.toJson(),
//     "quota_document": quotaDocument.toJson(),
//   };
// }
//
// class Info {
//   Info({
//     this.name,
//     this.values,
//   });
//
//   String name;
//   InfoValues values;
//
//   factory Info.fromJson(Map<String, dynamic> json) => Info(
//     name: json["name"],
//     values: InfoValues.fromJson(json["values"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "values": values.toJson(),
//   };
// }
//
// class InfoValues {
//   InfoValues({
//     this.requestId,
//     this.requestStatus,
//     this.requestRegion,
//     this.fromSite,
//   });
//
//   RequestId requestId;
//   RequestStatus requestStatus;
//   FromSite requestRegion;
//   FromSite fromSite;
//
//   factory InfoValues.fromJson(Map<String, dynamic> json) => InfoValues(
//     requestId: RequestId.fromJson(json["request_id"]),
//     requestStatus: RequestStatus.fromJson(json["request_status"]),
//     requestRegion: FromSite.fromJson(json["request_region"]),
//     fromSite: FromSite.fromJson(json["from_site"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "request_id": requestId.toJson(),
//     "request_status": requestStatus.toJson(),
//     "request_region": requestRegion.toJson(),
//     "from_site": fromSite.toJson(),
//   };
// }
//
// class RequestId {
//   RequestId({
//     this.value,
//     this.type,
//     this.name,
//   });
//
//   int value;
//   Type type;
//   String name;
//
//   factory RequestId.fromJson(Map<String, dynamic> json) => RequestId(
//     value: json["value"],
//     type: typeValues.map[json["type"]],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "value": value,
//     "type": typeValues.reverse[type],
//     "name": name,
//   };
// }
//
// class RequestStatus {
//   RequestStatus({
//     this.value,
//     this.type,
//     this.name,
//   });
//
//   Value value;
//   String type;
//   String name;
//
//   factory RequestStatus.fromJson(Map<String, dynamic> json) => RequestStatus(
//     value: Value.fromJson(json["value"]),
//     type: json["type"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "value": value.toJson(),
//     "type": type,
//     "name": name,
//   };
// }
//
// class Value {
//   Value({
//     this.id,
//     this.name,
//   });
//
//   String id;
//   String name;
//
//   factory Value.fromJson(Map<String, dynamic> json) => Value(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

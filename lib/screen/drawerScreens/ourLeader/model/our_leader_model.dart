// To parse this JSON data, do
//
//     final ourLeaderResponseModel = ourLeaderResponseModelFromJson(jsonString);

import 'dart:convert';

OurLeaderResponseModel ourLeaderResponseModelFromJson(String str) => OurLeaderResponseModel.fromJson(json.decode(str));

String ourLeaderResponseModelToJson(OurLeaderResponseModel data) => json.encode(data.toJson());

class OurLeaderResponseModel {
  String? message;
  dynamic devMessage;
  OurLeaderBody? body;

  OurLeaderResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory OurLeaderResponseModel.fromJson(Map<String, dynamic> json) => OurLeaderResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : OurLeaderBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class OurLeaderBody {
  List<OurLeaderDatum>? data;
  int? filteredCount;
  int? totalCount;

  OurLeaderBody({
    this.data,
    this.filteredCount,
    this.totalCount,
  });

  factory OurLeaderBody.fromJson(Map<String, dynamic> json) => OurLeaderBody(
    data: json["data"] == null ? [] : List<OurLeaderDatum>.from(json["data"]!.map((x) => OurLeaderDatum.fromJson(x))),
    filteredCount: json["filteredCount"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "filteredCount": filteredCount,
    "totalCount": totalCount,
  };
}

class OurLeaderDatum {
  int? id;
  String? name;
  String? department;
  String? officeContact;
  String? homeContact;
  String? designation;

  OurLeaderDatum({
    this.id,
    this.name,
    this.department,
    this.officeContact,
    this.homeContact,
    this.designation,
  });

  factory OurLeaderDatum.fromJson(Map<String, dynamic> json) => OurLeaderDatum(
    id: json["id"],
    name: json["name"],
    department: json["department"],
    officeContact: json["office_contact"],
    homeContact: json["home_contact"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "department": department,
    "office_contact": officeContact,
    "home_contact": homeContact,
    "designation": designation,
  };
}

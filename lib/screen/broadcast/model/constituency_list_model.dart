// To parse this JSON data, do
//
//     final constituencyListResponseModel = constituencyListResponseModelFromJson(jsonString);

import 'dart:convert';

ConstituencyListResponseModel constituencyListResponseModelFromJson(String str) => ConstituencyListResponseModel.fromJson(json.decode(str));

String constituencyListResponseModelToJson(ConstituencyListResponseModel data) => json.encode(data.toJson());

class ConstituencyListResponseModel {
  String? message;
  dynamic devMessage;
  ConstituencyListBody? body;

  ConstituencyListResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory ConstituencyListResponseModel.fromJson(Map<String, dynamic> json) => ConstituencyListResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : ConstituencyListBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class ConstituencyListBody {
  List<ConstituencyListDatum>? data;
  int? filteredCount;
  int? totalCount;

  ConstituencyListBody({
    this.data,
    this.filteredCount,
    this.totalCount,
  });

  factory ConstituencyListBody.fromJson(Map<String, dynamic> json) => ConstituencyListBody(
    data: json["data"] == null ? [] : List<ConstituencyListDatum>.from(json["data"]!.map((x) => ConstituencyListDatum.fromJson(x))),
    filteredCount: json["filteredCount"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "filteredCount": filteredCount,
    "totalCount": totalCount,
  };
}

class ConstituencyListDatum {
  int? id;
  String? name;
  int? stateId;
  String? stateName;
  int? districtId;
  String? districtName;
  String? type;
  int? constituencyNumber;
  int? status;

  ConstituencyListDatum({
    this.id,
    this.name,
    this.stateId,
    this.stateName,
    this.districtId,
    this.districtName,
    this.type,
    this.constituencyNumber,
    this.status,
  });

  factory ConstituencyListDatum.fromJson(Map<String, dynamic> json) => ConstituencyListDatum(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    type: json["type"],
    constituencyNumber: json["constituency_number"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "state_name": stateName,
    "district_id": districtId,
    "district_name": districtName,
    "type": type,
    "constituency_number": constituencyNumber,
    "status": status,
  };
}

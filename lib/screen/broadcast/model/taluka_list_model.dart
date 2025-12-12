// To parse this JSON data, do
//
//     final talukaListResponseModel = talukaListResponseModelFromJson(jsonString);

import 'dart:convert';

TalukaListResponseModel talukaListResponseModelFromJson(String str) => TalukaListResponseModel.fromJson(json.decode(str));

String talukaListResponseModelToJson(TalukaListResponseModel data) => json.encode(data.toJson());

class TalukaListResponseModel {
  String? message;
  dynamic devMessage;
  TalukaBody? body;

  TalukaListResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory TalukaListResponseModel.fromJson(Map<String, dynamic> json) => TalukaListResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : TalukaBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class TalukaBody {
  List<TalukaDatum>? data;
  int? filteredCount;
  int? totalCount;

  TalukaBody({
    this.data,
    this.filteredCount,
    this.totalCount,
  });

  factory TalukaBody.fromJson(Map<String, dynamic> json) => TalukaBody(
    data: json["data"] == null ? [] : List<TalukaDatum>.from(json["data"]!.map((x) => TalukaDatum.fromJson(x))),
    filteredCount: json["filteredCount"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "filteredCount": filteredCount,
    "totalCount": totalCount,
  };
}

class TalukaDatum {
  int? id;
  String? name;
  int? stateId;
  String? stateName;
  int? districtId;
  String? districtName;
  int? status;

  TalukaDatum({
    this.id,
    this.name,
    this.stateId,
    this.stateName,
    this.districtId,
    this.districtName,
    this.status,
  });

  factory TalukaDatum.fromJson(Map<String, dynamic> json) => TalukaDatum(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "state_name": stateName,
    "district_id": districtId,
    "district_name": districtName,
    "status": status,
  };
}

// To parse this JSON data, do
//
//     final villageListResponseModel = villageListResponseModelFromJson(jsonString);

import 'dart:convert';

VillageListResponseModel villageListResponseModelFromJson(String str) => VillageListResponseModel.fromJson(json.decode(str));

String villageListResponseModelToJson(VillageListResponseModel data) => json.encode(data.toJson());

class VillageListResponseModel {
  String? message;
  dynamic devMessage;
  VillageBody? body;

  VillageListResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory VillageListResponseModel.fromJson(Map<String, dynamic> json) => VillageListResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : VillageBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class VillageBody {
  List<VillageDatum>? data;
  int? filteredCount;
  int? totalCount;

  VillageBody({
    this.data,
    this.filteredCount,
    this.totalCount,
  });

  factory VillageBody.fromJson(Map<String, dynamic> json) => VillageBody(
    data: json["data"] == null ? [] : List<VillageDatum>.from(json["data"]!.map((x) => VillageDatum.fromJson(x))),
    filteredCount: json["filteredCount"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "filteredCount": filteredCount,
    "totalCount": totalCount,
  };
}

class VillageDatum {
  int? id;
  String? name;
  int? stateId;
  String? stateName;
  int? districtId;
  String? districtName;
  int? talukaId;
  String? talukaName;
  int? status;

  VillageDatum({
    this.id,
    this.name,
    this.stateId,
    this.stateName,
    this.districtId,
    this.districtName,
    this.talukaId,
    this.talukaName,
    this.status,
  });

  factory VillageDatum.fromJson(Map<String, dynamic> json) => VillageDatum(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    talukaId: json["taluka_id"],
    talukaName: json["taluka_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "state_name": stateName,
    "district_id": districtId,
    "district_name": districtName,
    "taluka_id": talukaId,
    "taluka_name": talukaName,
    "status": status,
  };
}

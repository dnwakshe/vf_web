// To parse this JSON data, do
//
//     final districtListResponseModel = districtListResponseModelFromJson(jsonString);

import 'dart:convert';

DistrictListResponseModel districtListResponseModelFromJson(String str) => DistrictListResponseModel.fromJson(json.decode(str));

String districtListResponseModelToJson(DistrictListResponseModel data) => json.encode(data.toJson());

class DistrictListResponseModel {
  String? message;
  dynamic devMessage;
  DistrictListBody? body;

  DistrictListResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory DistrictListResponseModel.fromJson(Map<String, dynamic> json) => DistrictListResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : DistrictListBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class DistrictListBody {
  List<DistrictListDatum>? data;
  int? filteredCount;
  int? totalCount;

  DistrictListBody({
    this.data,
    this.filteredCount,
    this.totalCount,
  });

  factory DistrictListBody.fromJson(Map<String, dynamic> json) => DistrictListBody(
    data: json["data"] == null ? [] : List<DistrictListDatum>.from(json["data"]!.map((x) => DistrictListDatum.fromJson(x))),
    filteredCount: json["filteredCount"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "filteredCount": filteredCount,
    "totalCount": totalCount,
  };
}

class DistrictListDatum {
  int? id;
  int? stateId;
  String? stateName;
  String? name;
  int? districtCode;
  int? status;

  DistrictListDatum({
    this.id,
    this.stateId,
    this.stateName,
    this.name,
    this.districtCode,
    this.status,
  });

  factory DistrictListDatum.fromJson(Map<String, dynamic> json) => DistrictListDatum(
    id: json["id"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    name: json["name"],
    districtCode: json["district_code"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_id": stateId,
    "state_name": stateName,
    "name": name,
    "district_code": districtCode,
    "status": status,
  };
}

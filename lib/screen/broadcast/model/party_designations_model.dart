// To parse this JSON data, do
//
//     final partyDesignationsResponseModel = partyDesignationsResponseModelFromJson(jsonString);

import 'dart:convert';

PartyDesignationsResponseModel partyDesignationsResponseModelFromJson(String str) => PartyDesignationsResponseModel.fromJson(json.decode(str));

String partyDesignationsResponseModelToJson(PartyDesignationsResponseModel data) => json.encode(data.toJson());

class PartyDesignationsResponseModel {
  String? message;
  dynamic devMessage;
  PartyDesignationsBody? body;

  PartyDesignationsResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory PartyDesignationsResponseModel.fromJson(Map<String, dynamic> json) => PartyDesignationsResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : PartyDesignationsBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class PartyDesignationsBody {
  List<PartyDesignationsDatum>? data;

  PartyDesignationsBody({
    this.data,
  });

  factory PartyDesignationsBody.fromJson(Map<String, dynamic> json) => PartyDesignationsBody(
    data: json["data"] == null ? [] : List<PartyDesignationsDatum>.from(json["data"]!.map((x) => PartyDesignationsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PartyDesignationsDatum {
  int? id;
  String? name;
  String? slug;
  String? areaType;
  String? type;
  int? priority;
  String? config;

  PartyDesignationsDatum({
    this.id,
    this.name,
    this.slug,
    this.areaType,
    this.type,
    this.priority,
    this.config,
  });

  factory PartyDesignationsDatum.fromJson(Map<String, dynamic> json) => PartyDesignationsDatum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    areaType: json["area_type"],
    type: json["type"],
    priority: json["priority"],
    config: json["config"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "area_type": areaType,
    "type": type,
    "priority": priority,
    "config": config,
  };
}

// To parse this JSON data, do
//
//     final partyWingResponseModel = partyWingResponseModelFromJson(jsonString);

import 'dart:convert';

PartyWingResponseModel partyWingResponseModelFromJson(String str) => PartyWingResponseModel.fromJson(json.decode(str));

String partyWingResponseModelToJson(PartyWingResponseModel data) => json.encode(data.toJson());

class PartyWingResponseModel {
  String? message;
  dynamic devMessage;
  PartyWingBody? body;

  PartyWingResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory PartyWingResponseModel.fromJson(Map<String, dynamic> json) => PartyWingResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : PartyWingBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class PartyWingBody {
  List<PartyWingsList>? data;

  PartyWingBody({
    this.data,
  });

  factory PartyWingBody.fromJson(Map<String, dynamic> json) => PartyWingBody(
    data: json["data"] == null ? [] : List<PartyWingsList>.from(json["data"]!.map((x) => PartyWingsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PartyWingsList {
  int? id;
  String? name;
  int? status;

  PartyWingsList({
    this.id,
    this.name,
    this.status,
  });

  factory PartyWingsList.fromJson(Map<String, dynamic> json) => PartyWingsList(
    id: json["id"],
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
  };
}

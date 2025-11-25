// To parse this JSON data, do
//
//     final stateListResponseModel = stateListResponseModelFromJson(jsonString);

import 'dart:convert';

StateListResponseModel stateListResponseModelFromJson(String str) => StateListResponseModel.fromJson(json.decode(str));

String stateListResponseModelToJson(StateListResponseModel data) => json.encode(data.toJson());

class StateListResponseModel {
  String? message;
  dynamic devMessage;
  List<StateBody>? body;

  StateListResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory StateListResponseModel.fromJson(Map<String, dynamic> json) => StateListResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? [] : List<StateBody>.from(json["body"]!.map((x) => StateBody.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class StateBody {
  int? id;
  String? name;
  String? stateCode;
  int? status;

  StateBody({
    this.id,
    this.name,
    this.stateCode,
    this.status,
  });

  factory StateBody.fromJson(Map<String, dynamic> json) => StateBody(
    id: json["id"],
    name: json["name"],
    stateCode: json["state_code"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_code": stateCode,
    "status": status,
  };
}

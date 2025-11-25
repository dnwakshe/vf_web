// To parse this JSON data, do
//
//     final getMemberListResponseModel = getMemberListResponseModelFromJson(jsonString);

import 'dart:convert';

GetMemberListResponseModel getMemberListResponseModelFromJson(String str) => GetMemberListResponseModel.fromJson(json.decode(str));

String getMemberListResponseModelToJson(GetMemberListResponseModel data) => json.encode(data.toJson());

class GetMemberListResponseModel {
  String? message;
  dynamic devMessage;
  GetMemberBody? body;

  GetMemberListResponseModel({
    this.message,
    this.devMessage,
    this.body,
  });

  factory GetMemberListResponseModel.fromJson(Map<String, dynamic> json) => GetMemberListResponseModel(
    message: json["message"],
    devMessage: json["DevMessage"],
    body: json["body"] == null ? null : GetMemberBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DevMessage": devMessage,
    "body": body?.toJson(),
  };
}

class GetMemberBody {
  int? totalCount;
  int? filteredCount;
  String? bucketUrl;
  List<GetMemberDatum>? data;

  GetMemberBody({
    this.totalCount,
    this.filteredCount,
    this.bucketUrl,
    this.data,
  });

  factory GetMemberBody.fromJson(Map<String, dynamic> json) => GetMemberBody(
    totalCount: json["total_count"],
    filteredCount: json["filtered_count"],
    bucketUrl: json["bucket_url"],
    data: json["data"] == null ? [] : List<GetMemberDatum>.from(json["data"]!.map((x) => GetMemberDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "filtered_count": filteredCount,
    "bucket_url": bucketUrl,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetMemberDatum {
  int? memberId;
  String? memberName;
  String? email;
  String? memberDob;
  String? profileStatus;
  String? partyId;
  String? memberDesignation;
  String? designationType;
  String? pincode;
  String? addressDetails;
  String? addressType;
  String? stateName;
  String? stateCode;
  String? districtName;
  String? talukaName;
  String? villageName;
  String? contacts;
  String? fileName;
  String? fileUrl;

  GetMemberDatum({
    this.memberId,
    this.memberName,
    this.email,
    this.memberDob,
    this.profileStatus,
    this.partyId,
    this.memberDesignation,
    this.designationType,
    this.pincode,
    this.addressDetails,
    this.addressType,
    this.stateName,
    this.stateCode,
    this.districtName,
    this.talukaName,
    this.villageName,
    this.contacts,
    this.fileName,
    this.fileUrl,
  });

  factory GetMemberDatum.fromJson(Map<String, dynamic> json) => GetMemberDatum(
    memberId: json["member_id"],
    memberName: json["member_name"],
    email: json["email"],
    memberDob: json["member_dob"],
    profileStatus: json["profile_status"],
    partyId: json["party_id"],
    memberDesignation: json["member_designation"],
    designationType: json["designation_type"],
    pincode: json["pincode"],
    addressDetails: json["address_details"],
    addressType: json["address_type"],
    stateName: json["state_name"],
    stateCode: json["state_code"],
    districtName: json["district_name"],
    talukaName: json["taluka_name"],
    villageName: json["village_name"],
    contacts: json["contacts"],
    fileName: json["file_name"],
    fileUrl: json["file_url"],
  );

  Map<String, dynamic> toJson() => {
    "member_id": memberId,
    "member_name": memberName,
    "email": email,
    "member_dob": memberDob,
    "profile_status": profileStatus,
    "party_id": partyId,
    "member_designation": memberDesignation,
    "designation_type": designationType,
    "pincode": pincode,
    "address_details": addressDetails,
    "address_type": addressType,
    "state_name": stateName,
    "state_code": stateCode,
    "district_name": districtName,
    "taluka_name": talukaName,
    "village_name": villageName,
    "contacts": contacts,
    "file_name": fileName,
    "file_url": fileUrl,
  };
}

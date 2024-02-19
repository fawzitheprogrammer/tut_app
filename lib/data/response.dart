import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotification")
  int? numOfNotification;
  CustomerResponse({this.id, this.name, this.numOfNotification});

  factory CustomerResponse.fromJson(Map<String, dynamic> json) {
    return _$CustomerResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phone")
  int? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactResponse({this.phone, this.email, this.link});

  factory ContactResponse.fromJson(Map<String, dynamic> json) {
    return _$ContactResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;

  @JsonKey(name: "contacts")
  ContactResponse? contactResponse;

  AuthResponse({this.contactResponse, this.customerResponse});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

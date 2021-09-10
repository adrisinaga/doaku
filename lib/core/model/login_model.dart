// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel authModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String authModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    @required this.status,
    @required this.data,
  });

  final String? status;
  final List<Datum>? data;

  LoginModel copyWith({
    String? status,
    List<Datum>? data,
  }) =>
      LoginModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    @required this.id,
    @required this.nama,
    @required this.email,
    @required this.password,
    @required this.tentang,
    @required this.role,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final String? id;
  final String? nama;
  final String? email;
  final String? password;
  final String? tentang;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum copyWith({
    String? id,
    String? nama,
    String? email,
    String? password,
    String? tentang,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        email: email ?? this.email,
        password: password ?? this.password,
        tentang: tentang ?? this.tentang,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        tentang: json["tentang"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "password": password,
        "tentang": tentang,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// To parse this JSON data, do
//
//     final doaModel = doaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DoaModel doaModelFromJson(String str) => DoaModel.fromJson(json.decode(str));

String doaModelToJson(DoaModel data) => json.encode(data.toJson());

class DoaModel {
  DoaModel({
    @required this.status,
    @required this.data,
  });

  final String? status;
  final List<Datum>? data;

  DoaModel copyWith({
    String? status,
    List<Datum>? data,
  }) =>
      DoaModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory DoaModel.fromJson(Map<String, dynamic> json) => DoaModel(
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
    @required this.isiDoa,
    @required this.idUser,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final int? id;
  final String? isiDoa;
  final String? idUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum copyWith({
    int? id,
    String? isiDoa,
    String? idUser,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        isiDoa: isiDoa ?? this.isiDoa,
        idUser: idUser ?? this.idUser,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    isiDoa: json["isi_doa"],
    idUser: json["id_user"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isi_doa": isiDoa,
    "id_user": idUser,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class ResponsePostDoa {
  ResponsePostDoa({
    @required this.isiDoa,
    @required this.idUser,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.id,
  });

  final String? isiDoa;
  final String? idUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;

  ResponsePostDoa copyWith({
    int? id,
    String? isiDoa,
    String? idUser,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ResponsePostDoa(
        id: id ?? this.id,
        isiDoa: isiDoa ?? this.isiDoa,
        idUser: idUser ?? this.idUser,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ResponsePostDoa.fromJson(Map<String, dynamic> json) => ResponsePostDoa(
    isiDoa: json["isi_doa"],
    idUser: json["id_user"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "isi_doa": isiDoa,
    "id_user": idUser,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "id": id,
  };
}

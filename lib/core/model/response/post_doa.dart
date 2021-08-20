import 'dart:convert';

import 'package:flutter/foundation.dart';

ResponsePostDoa responsePostDoaFromJson(String str) => ResponsePostDoa.fromJson(json.decode(str));

String responsePostDoaToJson(ResponsePostDoa data) => json.encode(data.toJson());

class ResponsePostDoa {
  ResponsePostDoa({
    @required this.status,
    @required this.data,
  });

  final String? status;
  final Data? data;

  ResponsePostDoa copyWith({
    String? status,
    Data? data,
  }) =>
      ResponsePostDoa(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory ResponsePostDoa.fromJson(Map<String, dynamic> json) => ResponsePostDoa(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    @required this.isiDoa,
    @required this.idUser,
    @required this.jumlahOrangBerdoa,
    @required this.updatedAt,
    @required this.createdAt,
    @required this.id,
  });

  final String? isiDoa;
  final String? idUser;
  final int? jumlahOrangBerdoa;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data copyWith({
    String? isiDoa,
    String? idUser,
    int? jumlahOrangBerdoa,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Data(
        isiDoa: isiDoa ?? this.isiDoa,
        idUser: idUser ?? this.idUser,
        jumlahOrangBerdoa: jumlahOrangBerdoa ?? this.jumlahOrangBerdoa,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isiDoa: json["isi_doa"],
    idUser: json["id_user"],
    jumlahOrangBerdoa: json["jumlah_orang_berdoa"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "isi_doa": isiDoa,
    "id_user": idUser,
    "jumlah_orang_berdoa": jumlahOrangBerdoa,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
// To parse this JSON data, do
//
//     final responsePostBerdoa = responsePostBerdoaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponsePostBerdoa responsePostBerdoaFromJson(String str) => ResponsePostBerdoa.fromJson(json.decode(str));

String responsePostBerdoaToJson(ResponsePostBerdoa data) => json.encode(data.toJson());

class ResponsePostBerdoa {
  ResponsePostBerdoa({
    @required this.status,
    @required this.data,
  });

  final String? status;
  final Data? data;

  ResponsePostBerdoa copyWith({
    String? status,
    Data? data,
  }) =>
      ResponsePostBerdoa(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory ResponsePostBerdoa.fromJson(Map<String, dynamic> json) => ResponsePostBerdoa(
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
    @required this.id,
    @required this.isiDoa,
    @required this.idUser,
    @required this.jumlahOrangBerdoa,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final int? id;
  final String? isiDoa;
  final String? idUser;
  final int? jumlahOrangBerdoa;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data copyWith({
    int? id,
    String? isiDoa,
    String? idUser,
    int? jumlahOrangBerdoa,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        isiDoa: isiDoa ?? this.isiDoa,
        idUser: idUser ?? this.idUser,
        jumlahOrangBerdoa: jumlahOrangBerdoa ?? this.jumlahOrangBerdoa,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    isiDoa: json["isi_doa"],
    idUser: json["id_user"],
    jumlahOrangBerdoa: json["jumlah_orang_berdoa"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isi_doa": isiDoa,
    "id_user": idUser,
    "jumlah_orang_berdoa": jumlahOrangBerdoa,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

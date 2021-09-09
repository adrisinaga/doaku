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
    @required this.totalPrayed,
    @required this.userName,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final int? id;
  final String? isiDoa;
  final String? idUser;
  final String? totalPrayed;
  final String? userName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum copyWith({
    int? id,
    String? isiDoa,
    String? idUser,
    String? totalPrayed,
    String? userName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        isiDoa: isiDoa ?? this.isiDoa,
        idUser: idUser ?? this.idUser,
        userName: userName ?? this.userName,
        totalPrayed: totalPrayed?? this.totalPrayed,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    isiDoa: json["isi_doa"],
    idUser: json["id_user"],
    userName: json["nama"],
    totalPrayed: json["jumlah_orang_berdoa"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isi_doa": isiDoa,
    "id_user": idUser,
    "nama": userName,
    "jumlah_orang_berdoa": totalPrayed,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
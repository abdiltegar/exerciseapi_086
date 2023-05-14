// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BarangModel {
  final String idBarang;
  final String title;
  final String idKategoriBarang;
  BarangModel({
    required this.idBarang,
    required this.title,
    required this.idKategoriBarang,
  });

  BarangModel copyWith({
    String? idBarang,
    String? title,
    String? idKategoriBarang,
  }) {
    return BarangModel(
      idBarang: idBarang ?? this.idBarang,
      title: title ?? this.title,
      idKategoriBarang: idKategoriBarang ?? this.idKategoriBarang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idBarang': idBarang,
      'title': title,
      'idKategoriBarang': idKategoriBarang,
    };
  }

  factory BarangModel.fromMap(Map<String, dynamic> map) {
    return BarangModel(
      idBarang: map['idBarang'] as String,
      title: map['title'] as String,
      idKategoriBarang: map['idKategoriBarang'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BarangModel.fromJson(String source) => BarangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BarangModel(idBarang: $idBarang, title: $title, idKategoriBarang: $idKategoriBarang)';

  @override
  bool operator ==(covariant BarangModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idBarang == idBarang &&
      other.title == title &&
      other.idKategoriBarang == idKategoriBarang;
  }

  @override
  int get hashCode => idBarang.hashCode ^ title.hashCode ^ idKategoriBarang.hashCode;
  }

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class KategoriBarangModel {
  final int idKategoriBarang;
  final String namaKategoriBarang;
  KategoriBarangModel({
    required this.idKategoriBarang,
    required this.namaKategoriBarang,
  });

  KategoriBarangModel copyWith({
    int? idKategoriBarang,
    String? namaKategoriBarang,
  }) {
    return KategoriBarangModel(
      idKategoriBarang: idKategoriBarang ?? this.idKategoriBarang,
      namaKategoriBarang: namaKategoriBarang ?? this.namaKategoriBarang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_kategori_barang': idKategoriBarang,
      'nama_kategori_barang': namaKategoriBarang,
    };
  }

  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      idKategoriBarang: map['id_kategori_barang'] as int,
      namaKategoriBarang: map['nama_kategori_barang'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) => KategoriBarangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KategoriBarangModel(id_kategori_barang: $idKategoriBarang, nama_kategori_barang: $namaKategoriBarang)';

  @override
  bool operator ==(covariant KategoriBarangModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idKategoriBarang == idKategoriBarang &&
      other.namaKategoriBarang == namaKategoriBarang;
  }

  @override
  int get hashCode => idKategoriBarang.hashCode ^ namaKategoriBarang.hashCode;
  }

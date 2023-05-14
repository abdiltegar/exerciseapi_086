// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class KategoriBarangModel {
  final String namaKategoriBarang;
  KategoriBarangModel({
    required this.namaKategoriBarang,
  });

  KategoriBarangModel copyWith({
    String? namaKategoriBarang,
  }) {
    return KategoriBarangModel(
      namaKategoriBarang: namaKategoriBarang ?? this.namaKategoriBarang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama_kategori_barang': namaKategoriBarang,
    };
  }

  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      namaKategoriBarang: map['nama_kategori_barang'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) => KategoriBarangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KategoriBarangModel(nama_kategori_barang: $namaKategoriBarang)';

  @override
  bool operator ==(covariant KategoriBarangModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.namaKategoriBarang == namaKategoriBarang;
  }

  @override
  int get hashCode => namaKategoriBarang.hashCode;
  }

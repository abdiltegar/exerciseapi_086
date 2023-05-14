import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apipoke_client/model/kategori_barang/kategori_barang_model.dart';

class KategoriBarangController {
    final String apiUrl = "http://10.20.14.43:8080/apipoke/public/api";

    Future<List<KategoriBarangModel>> getKategoriBarang() async {
      var res = await http.get(Uri.parse("$apiUrl/barang/getAllKB/"));

      if (res.statusCode == 200){

        var data = json.decode(res.body);
        List<KategoriBarangModel> kategoriBarangs = [];

        for (var i in data){
          KategoriBarangModel kategoriBarang = KategoriBarangModel.fromMap(i);
          kategoriBarangs.add(kategoriBarang);
        }

        return kategoriBarangs;
      } else {
        throw Exception("Gagal mengambil data kategori barang");
      }
    }

    Future addKategoriBarang(KategoriBarangModel kategoriBarang) async {
      var res = await http.post(Uri.parse("$apiUrl/barang/addKB"), 
      body: {
        "nama_kategori_barang" : kategoriBarang.namaKategoriBarang,
      });

      if(res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw Exception("Gagal menambah data kategori barang");
      }
    } 

    Future updateKategoriBarang(KategoriBarangModel kategoriBarang) async {
      var idKategoriBarang = kategoriBarang.idKategoriBarang;
      var res = await http.post(Uri.parse("$apiUrl/barang/updateKB/$idKategoriBarang"), 
      body: {
        "nama_kategori_barang" : kategoriBarang.namaKategoriBarang,
      });

      if(res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw Exception("Gagal mengubah data kategori barang");
      }
    }

    Future deleteKategoriBarang(String id) async {
      var res = await http.post(Uri.parse("$apiUrl/barang/deleteKB/$id"));

      if(res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw Exception("Gagal menghapus data kategori barang");
      }
    } 
}
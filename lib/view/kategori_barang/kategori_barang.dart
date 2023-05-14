import 'package:apipoke_client/controller/kategori_barang/kategori_barang_controller.dart';
import 'package:apipoke_client/model/kategori_barang/kategori_barang_model.dart';
import 'package:apipoke_client/view/kategori_barang/add_kategori_barang.dart';
import 'package:apipoke_client/view/kategori_barang/update_kategori_barang.dart';
import 'package:flutter/material.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  List<KategoriBarangModel> kategoriBarangs = [];

  @override
  void initState() {
    getKategoriBarang();
    super.initState();
  }

  void getKategoriBarang() async {
    final resGet = await kategoriBarangController.getKategoriBarang();

    setState(() {
      kategoriBarangs = resGet;
    });
  }

  void deleteKategoriBarang(int id) async {
    await kategoriBarangController.deleteKategoriBarang(id);
    getKategoriBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kategori Barang"),),
      body: SafeArea(
        child: listItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddKategoriBarang()));        
        },
        child: const Icon(Icons.add)),
    );
  }

  Widget listItems(){
    return ListView(
      children: kategoriBarangs.map((e) {
        return Padding(
          padding: const EdgeInsets.all(1),
          child: InkWell(
            onLongPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateKategoriBarang(kategoriBarang: e)));
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.meeting_room, color: Colors.blue,),
                title: Text(e.namaKategoriBarang, style: const TextStyle(color: Colors.blue),),
                trailing: IconButton(
                  onPressed: () {
                    deleteKategoriBarang(e.idKategoriBarang);
                    var snackBar = const SnackBar(content: Text('Data Berhasil Dihapus'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
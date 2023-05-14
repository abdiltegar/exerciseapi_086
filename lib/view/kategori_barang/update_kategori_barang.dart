import "package:apipoke_client/controller/kategori_barang/kategori_barang_controller.dart";
import "package:apipoke_client/model/kategori_barang/kategori_barang_model.dart";
import "package:apipoke_client/view/kategori_barang/kategori_barang.dart";
import "package:apipoke_client/widget/input_text.dart";
import "package:flutter/material.dart";

class UpdateKategoriBarang extends StatefulWidget {

  UpdateKategoriBarang({
    super.key,
    required this.kategoriBarang
  });

  KategoriBarangModel kategoriBarang;

  @override
  State<UpdateKategoriBarang> createState() => _UpdateKategoriBarangState();
}

class _UpdateKategoriBarangState extends State<UpdateKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();

  final namaCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namaCtrl.text = widget.kategoriBarang.namaKategoriBarang;
  }

  void updateKategoriBarang() async {
    if(_formKey.currentState!.validate()){
      debugPrint("Validate");
      
      _formKey.currentState!.save();
      var kategoriBarang = KategoriBarangModel(
        idKategoriBarang: widget.kategoriBarang.idKategoriBarang,
        namaKategoriBarang: namaCtrl.text
      );
      await kategoriBarangController.updateKategoriBarang(kategoriBarang);

    }else{
      debugPrint("Not Validate");
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kategori Barang"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0, bottom: 10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Nama Kategori Barang", style: TextStyle(color: Colors.blue)),
                            InputText(validatorMessage: "Nama kategori barang tidak boleh kosong", prefixIcon: const Icon(Icons.person), labelText: "Masukkan nama kategori barang", controller: namaCtrl),
                            const SizedBox(height: 10,),
                          ],
                        )
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: (){
                                updateKategoriBarang();

                                var snackBar = const SnackBar(content: Text('Data Berhasil Disimpan'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const KategoriBarang()));
                              },
                              child: const Text("Save", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
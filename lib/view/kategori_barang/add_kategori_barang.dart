import "package:apipoke_client/controller/kategori_barang/kategori_barang_controller.dart";
import "package:apipoke_client/model/kategori_barang/kategori_barang_model.dart";
import "package:apipoke_client/view/kategori_barang/kategori_barang.dart";
import "package:apipoke_client/widget/input_text.dart";
import "package:flutter/material.dart";

class AddKategoriBarang extends StatefulWidget {
  const AddKategoriBarang({super.key});

  @override
  State<AddKategoriBarang> createState() => _AddKategoriBarangState();
}

class _AddKategoriBarangState extends State<AddKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();

  final namaCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addKategoriBarang() async {
    if(_formKey.currentState!.validate()){
      debugPrint("Validate");
      
      _formKey.currentState!.save();
      var kategoriBarang = KategoriBarangModel(
        namaKategoriBarang: namaCtrl.text
      );
      await kategoriBarangController.addKategoriBarang(kategoriBarang);

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
                            InputText(validatorMessage: "Nama kategori barang tidak boleh kosong", prefixIcon: const Icon(Icons.person), labelText: "Enter your name", controller: namaCtrl),
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
                                addKategoriBarang();
                                
                                Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const KategoriBarang()));

                                var snackBar = const SnackBar(content: Text('Data Berhasil Disimpan'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
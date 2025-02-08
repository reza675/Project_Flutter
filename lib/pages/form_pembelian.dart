import 'package:flutter/material.dart';
import 'package:sole_mate/models/sepatu.dart';
import 'package:sole_mate/pages/home_page.dart';

class FormPembelian extends StatefulWidget {
  final Sepatu sepatu;
  final String username;
  final String password;
  final VoidCallback onPembelianSelesai;

  const FormPembelian({
    super.key,
    required this.sepatu,
    required this.username,
    required this.password,
    required this.onPembelianSelesai,
  });

  @override
  State<FormPembelian> createState() => _FormPembelianState();
}

class _FormPembelianState extends State<FormPembelian> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk TextField
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    teleponController.dispose();
    kodePosController.dispose();
    super.dispose();
  }

  void prosesPembelian() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Pembelian Berhasil!'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              widget.onPembelianSelesai();
              Navigator.pop(context); 
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    username: widget.username,
                    password: widget.password,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalHarga =
        int.parse(widget.sepatu.harga.replaceAll(RegExp(r'[^0-9]'), '')) *
            widget.sepatu.jumlah;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pembelian'),
        backgroundColor: Colors.blueGrey[300],
      ),
      backgroundColor: Colors.blueGrey[100],
      body: SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar Sepatu
              Center(
                child: Image.asset(
                  widget.sepatu.gambar,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              // Nama, Harga, dan Jumlah
              Text(
                widget.sepatu.nama,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Harga: Rp ${totalHarga.toString()}',
                style: const TextStyle(fontSize: 16, color: Colors.brown),
              ),
              Text(
                'Jumlah: ${widget.sepatu.jumlah}',
                style: const TextStyle(fontSize: 16, color: Colors.brown),
              ),
              const SizedBox(height: 20),

              // Form Input
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: namaController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: alamatController,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: teleponController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'No Telepon',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor telepon tidak boleh kosong';
                        }
                        if (value.length < 10) {
                          return 'Nomor telepon tidak valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: kodePosController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Kode Pos',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kode pos tidak boleh kosong';
                        }
                        if (value.length != 5) {
                          return 'Kode pos harus 5 digit';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Tombol Submit
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: prosesPembelian,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(
                            'Beli Sekarang',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

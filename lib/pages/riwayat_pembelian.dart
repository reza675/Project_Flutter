import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/models/keranjang.dart';

class RiwayatPembelian extends StatelessWidget {
  const RiwayatPembelian({super.key});

  @override
  Widget build(BuildContext context) {
    final keranjang = Provider.of<Keranjang>(context);
    final riwayat = keranjang.getRiwayatList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Riwayat Pembelian',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown[100],
      body: riwayat.isEmpty
          ? const Center(
              child: Text(
                'Belum ada riwayat pembelian.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: riwayat.length,
              itemBuilder: (context, index) {
                final sepatu = riwayat[index];
                final totalHarga =
                    int.parse(sepatu.harga.replaceAll('.', '')) * sepatu.jumlah;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        sepatu.gambar,
                        width: 75,
                        height: 75,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        sepatu.nama,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Rp ${sepatu.harga}\nJumlah: ${sepatu.jumlah}\nTotal Harga: Rp ${totalHarga.toString()}',
                        style: const TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          keranjang.hapusRiwayatPembelian(sepatu);
                        },
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

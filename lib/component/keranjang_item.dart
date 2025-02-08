import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/models/keranjang.dart';
import 'package:sole_mate/models/sepatu.dart';
import 'package:sole_mate/pages/form_pembelian.dart';

class KeranjangItem extends StatefulWidget {
  final Sepatu sepatu;
  final String username;
  final String password;

  const KeranjangItem({
    super.key,
    required this.sepatu,
    required this.username,
    required this.password,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  bool pembelian = false;

  // Fungsi untuk menandai bahwa item telah dibeli
  void tandaiPembelian() {
    setState(() {
      pembelian = true;
    });
  }

  // Fungsi untuk menghapus sepatu dari keranjang
  void hapusSepatu() {
    Provider.of<Keranjang>(context, listen: false)
        .hapusSepatuKeranjang(widget.sepatu);
  }

  // Fungsi untuk mengonversi harga String ke int
  int parseHarga(String harga) {
    String cleanedHarga = harga.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleanedHarga) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final keranjang = Provider.of<Keranjang>(context);
    final bool isPurchased = keranjang.isPurchased(widget.sepatu.nama);

    // Hitung total harga
    int totalHarga = parseHarga(widget.sepatu.harga) * widget.sepatu.jumlah;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              widget.sepatu.gambar,
              width: 75,
              height: 75,
              fit: BoxFit.fill,
            ),
            title: Text(
              widget.sepatu.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Rp ${widget.sepatu.harga}\nJumlah: ${widget.sepatu.jumlah}\nTotal Harga: Rp ${totalHarga.toString()}',
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: hapusSepatu,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 159, 193, 209), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: const Color.fromARGB(255, 159, 193, 209),
              ),
              padding: const EdgeInsets.all(4),
              child: isPurchased || pembelian
                  ? const Text(
                      'Pembelian berhasil dilakukan',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FormPembelian(
                                sepatu: widget.sepatu,
                                username: widget.username,
                                password: widget.password,
                                onPembelianSelesai: () {
                                  keranjang
                                      .tandaiSebagaiDibeli(widget.sepatu.nama);
                                  tandaiPembelian();
                                },
                              );
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Beli',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

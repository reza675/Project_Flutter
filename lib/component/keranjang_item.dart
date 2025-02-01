import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/models/keranjang.dart';
import 'package:sole_mate/models/sepatu.dart';

class KeranjangItem extends StatefulWidget {
  final Sepatu sepatu;
  final String tambahanKata = 'Rp ';

  const KeranjangItem({super.key, required this.sepatu});

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  void hapusSepatu() {
    Provider.of<Keranjang>(context, listen: false).hapusSepatuKeranjang(widget.sepatu);
  }

  // Fungsi untuk mengonversi harga String ke int
  int parseHarga(String harga) {
    String cleanedHarga = harga.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleanedHarga) ?? 0; 
  }

  @override
  Widget build(BuildContext context) {
    // Hitung total harga
    int totalHarga = parseHarga(widget.sepatu.harga) * widget.sepatu.jumlah;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
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
          '${widget.tambahanKata}${widget.sepatu.harga}\nJumlah: ${widget.sepatu.jumlah}\nTotal Harga: ${widget.tambahanKata}${totalHarga.toString()}',
          style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.w600),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: hapusSepatu,
          color: Colors.red,
        ),
      ),
    );
  }
}
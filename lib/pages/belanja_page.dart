import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/component/sepatu_tile.dart';
import 'package:sole_mate/models/keranjang.dart';
import 'package:sole_mate/models/sepatu.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add sepatu ke keranjang
  void addSepatuKeranjang(Sepatu sepatu) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Masukkan Jumlah Sepatu: '),
        content: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Jumlah',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty && int.tryParse(value) != null) {
              int jumlah = int.parse(value);
              if (jumlah > 0) {
                Provider.of<Keranjang>(context, listen: false)
                    .addSepatuDenganJumlah(sepatu, jumlah); 
              }
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tambah'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Keranjang>(
      builder: (context, value, child) => Column(
        children: [
          // Pencarian
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Cari produk disini',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          // Pesan
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Text(
              'Temukan Sepatu Impianmu...',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
              ),
            ),
          ),

          // Produk
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Big Sales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Daftar Sepatu
          Expanded(
            child: ListView.builder(
              itemCount: value.getSepatuList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Ambil sepatu dari daftar
                Sepatu sepatu = value.getSepatuList()[index];
                return SepatuTile(
                  sepatu: sepatu,
                  onTap: () => addSepatuKeranjang(sepatu),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Divider(   
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
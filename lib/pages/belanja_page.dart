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
  // State untuk menyimpan query pencarian
  String searchQuery = '';

  // Fungsi untuk menambahkan sepatu ke keranjang
  void addSepatuKeranjang(Sepatu sepatu) {
    int jumlah = 0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Masukkan Jumlah Sepatu: '),
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
              jumlah = int.parse(value);
            } else {
              jumlah = 0;
            }
          },
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Batal',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: TextButton(
              onPressed: () {
                var keranjang = Provider.of<Keranjang>(context, listen: false);
                if (jumlah > 0 && !keranjang.isPurchased(sepatu.nama)) {
                  keranjang.addSepatuDenganJumlah(sepatu, jumlah);
                } else if (keranjang.isPurchased(sepatu.nama)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sepatu ini sudah dibeli!')),
                  );
                  return;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Jumlah harus lebih dari 0')),
                  );
                  return;
                }
                Navigator.pop(context);
              },
              child: const Text(
                'Tambah',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Keranjang>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
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

            // Big Sales
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
            const SizedBox(height: 10),

            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.getSepatuList().length,
                itemBuilder: (context, index) {
                  Sepatu sepatu = value.getSepatuList()[index];

                  // Filter pencarian
                  if (searchQuery.isNotEmpty &&
                      !sepatu.nama.toLowerCase().contains(searchQuery)) {
                    return Container();
                  }

                  return SepatuTile(
                    sepatu: sepatu,
                    onTap: () => addSepatuKeranjang(sepatu),
                  );
                },
              ),
            ),

            // Garis pemisah
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Divider(thickness: 1),
            ),
          ],
        ),
      ),
    );
  }
}

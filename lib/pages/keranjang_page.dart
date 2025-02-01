import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/component/keranjang_item.dart';
import 'package:sole_mate/models/keranjang.dart';
import 'package:sole_mate/models/sepatu.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Keranjang>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            //heading
            const Text(
              'Keranjang',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            

            //list sepatu
            Expanded(
              child: ListView.builder(
                itemCount: value.getKeranjangList().length,
                itemBuilder: (context, index) {
                  Sepatu pilihanSepatu = value.getKeranjangList()[index];
                  return KeranjangItem(
                    sepatu: pilihanSepatu,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/component/favorite_tile.dart';
import 'package:sole_mate/models/keranjang.dart';
import '../models/sepatu.dart';

class SepatuTile extends StatelessWidget {
  final Sepatu sepatu;
  final String tambahan;
  final void Function()? onTap;

  const SepatuTile(
      {super.key,
      required this.sepatu,
      this.tambahan = 'RP ',
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool sudahDibeli = Provider.of<Keranjang>(context).isPurchased(sepatu.nama);
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FavoriteTile(),
          ],
        ),
        //gambar sepatu
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            sepatu.gambar,
            height: 275,
            width: 275,
            alignment: Alignment.topCenter,
            fit: BoxFit.fill,
          ),
        ),
        //deskripsi
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            sepatu.deskripsi,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        //harga
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nama sepatu
                  Text(
                    sepatu.nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),

                  //harga
                  Text(
                    tambahan + sepatu.harga,
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ],
              ),
              // Tombol beli
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: sudahDibeli ? Colors.green : Colors.brown,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: sudahDibeli
                    ? Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    : GestureDetector(
                        onTap: onTap,
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          color: Colors.white,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

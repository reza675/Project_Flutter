import 'package:flutter/material.dart';
import 'sepatu.dart';

class Keranjang extends ChangeNotifier {
  List<Sepatu> tokoSepatu = [
    Sepatu(
      nama: 'Nike Air Zoom Pegasus 37',
      harga: '2.300.000',
      gambar: 'lib/images/nikeairzoom.png',
      jumlah: 0,
      deskripsi:
          'Sepatu lari dengan teknologi Air Zoom untuk responsivitas maksimal dan bantalan yang nyaman.',
    ),
    Sepatu(
      nama: 'Nike Air Zoom Pegasus 38',
      harga: '2.100.000',
      gambar: 'lib/images/nikeairzoom38.png',
      jumlah: 0,
      deskripsi:
          'Versi terbaru dengan mesh yang lebih breathable dan fit yang lebih baik.',
    ),
    Sepatu(
      nama: 'Nike Joyride',
      harga: '1.075.000',
      gambar: 'lib/images/nikejoyride.png',
      jumlah: 0,
      deskripsi:
          'Teknologi revolutionary cushioning dengan ribuan manik-manik yang menyesuaikan bentuk kaki.',
    ),
    Sepatu(
      nama: 'Sneakers Skate Nike',
      harga: '1.300.000',
      gambar: 'lib/images/SneakersSkateNike.png',
      jumlah: 0,
      deskripsi:
          'Sepatu skateboarding dengan sol tahan aus dan grip maksimal.',
    ),
    Sepatu(
      nama: 'Nike Hyperadapt 1.0',
      harga: '950.000',
      gambar: 'lib/images/SneakersNikeMagHyperAdapt.png',
      jumlah: 0,
      deskripsi:
          'Sepatu futuristik dengan sistem pengencangan otomatis yang menyesuaikan dengan bentuk kaki Anda.',
    ),
    Sepatu(
      nama: 'Nike Air Flight',
      harga: '1.400.000',
      gambar: 'lib/images/NikeAirFlight89.png',
      jumlah: 0,
      deskripsi:
          'Sepatu basket klasik dengan unit Air-Sole untuk peredam kejut optimal.',
    ),
    Sepatu(
      nama: 'Air Jordan 1 Mid',
      harga: '2.050.000',
      gambar: 'lib/images/airjordan1mid.png',
      jumlah: 0,
      deskripsi:
          'Upper kulit premium dan teknologi Air cushioning untuk kenyamanan sepanjang hari.',
    ),
    Sepatu(
      nama: 'Air Jordan 4 Retro',
      harga: '3.700.000',
      gambar: 'lib/images/airjordan4retro.png',
      jumlah: 0,
      deskripsi:
          'Fitur visible Air unit dan material premium untuk gaya dan performa maksimal.',
    ),
  ];

  List<Sepatu> keranjangPengguna = [];
  List<Sepatu> getSepatuList() {
    return tokoSepatu;
  }

  List<Sepatu> getKeranjangList() {
    return keranjangPengguna;
  }

  void addSepatukeKeranjang(Sepatu sepatu) {
    bool sepatuAda = keranjangPengguna.any((item) => item.nama == sepatu.nama);
    if (sepatuAda) {
      Sepatu sepatuDiKeranjang =
          keranjangPengguna.firstWhere((item) => item.nama == sepatu.nama);
      sepatuDiKeranjang.jumlah += sepatu.jumlah;
    } else {
      keranjangPengguna.add(sepatu);
    }
    notifyListeners();
  }

  void hapusSepatuKeranjang(Sepatu sepatu) {
    keranjangPengguna.remove(sepatu);
    notifyListeners();
  }

 void addSepatuDenganJumlah(Sepatu sepatu, int jumlah) {
  Sepatu newSepatu = sepatu.copyWith(jumlah: jumlah);
  addSepatukeKeranjang(newSepatu);
}
  
}

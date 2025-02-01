class Sepatu {
  final String nama;
  final String harga;
  final String gambar;
  int jumlah;
  final String deskripsi;

  Sepatu({
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.jumlah,
    required this.deskripsi,
  });

  //salinan objek dengan jumlah yang diperbarui
  Sepatu copyWith({
    int? jumlah,
  }) {
    return Sepatu(
      nama: nama,
      harga: harga,
      gambar: gambar,
      jumlah: jumlah ?? this.jumlah,
      deskripsi: deskripsi,
    );
  }
}

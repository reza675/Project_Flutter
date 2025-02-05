import 'package:flutter/material.dart';

class FavoriteTile extends StatefulWidget {
  const FavoriteTile({super.key});

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  bool isFavorite = false;

  void toggleFavorite(BuildContext context) {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: () => toggleFavorite(context), // Tambahkan context
    );
  }
}

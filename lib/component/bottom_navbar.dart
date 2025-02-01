import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey.shade700,
        activeColor: Colors.brown.shade500,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade200,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 20,
        onTabChange: (value) => onTabChange?.call(value),
        tabs: const [
          GButton(
            icon: Icons.shopping_cart,
            text: 'Belanja',
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: 'Keranjang',
          ),
        ],
      ),
    );
  }
}

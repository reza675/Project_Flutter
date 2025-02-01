import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_mate/pages/landing_page.dart';
import 'models/keranjang.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>Keranjang(),
      builder: (context, child) => const MaterialApp(
        title:  'Sole Mate',
        debugShowCheckedModeBanner: false, 
        home: LandingPage(),
        ),
      );
  }
}
 
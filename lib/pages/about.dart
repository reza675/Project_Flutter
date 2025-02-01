import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'lib/images/logo.png',
                    color: Colors.black,
                    height: 250,
                    width: 250,
                  ),
                ),
                const SizedBox(height: 25),

                // Title
                const Text(
                  'Tentang Kami',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),

                // Sub Title
                const Text(
                  'Selamat datang di SoleMate!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),

                // Deskripsi
                const Text(
                  'SoleMate adalah platform e-commerce terkemuka yang menyediakan berbagai macam sepatu berkualitas tinggi untuk semua kebutuhan Anda. '
                  'Kami berkomitmen untuk memberikan pengalaman belanja yang mudah, aman, dan menyenangkan. '
                  'Temukan sepatu impian Anda di SoleMate dan nikmati penawaran menarik setiap hari!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

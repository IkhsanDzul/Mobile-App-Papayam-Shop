import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:papayamshopdemo/pages/notification_page.dart';
import 'package:papayamshopdemo/widgets/food.dart';

void main() => runApp(const DashboardPage());

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 238, 207),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 246, 238, 207),
          title: Builder(
            builder: (context) => Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello, User..',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bekasi, Indonesia',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        // Navigasi ke halaman notifikasi
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
                      },
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '3', // Jumlah pesan belum terbaca
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  const SizedBox(height: 20),

                  // Promo Banner
                  _buildPromoBanner(),

                  const SizedBox(height: 20),

                  // Search Bar
                  _buildSearchBar(),

                  const SizedBox(height: 20),

                  // Paling Populer
                  const SectionHeader(title: 'Populer'),
                  const SizedBox(height: 12),
                  const FoodGrid(
                    foodItems: [
                      FoodItem(
                          title: 'Papayam Gemoy',
                          subtitle: 'Ayam papayam paket besar kenyang',
                          price: 'Rp 142.000',
                          imageUrl: 'assets/images/PaketGemoy.png'),
                      FoodItem(
                          title: 'Papayam Geprek',
                          subtitle: 'Ayam sambal geprek pedas yang menggugah selera',
                          price: 'Rp 37.500',
                          imageUrl: 'assets/images/AyamGprek.png'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Rekomendasi untuk Kamu
                  const SectionHeader(title: 'Rekomendasi untuk kamu'),
                  const SizedBox(height: 12),
                  const FoodGrid(
                    foodItems: [
                      FoodItem(
                          title: 'Sate Papayam',
                          subtitle: 'Satay Ayam Dengan Bumbu Kacang yang Khas',
                          price: '20.000',
                          imageUrl: 'assets/images/SateAyam.png'),
                      FoodItem(
                          title: 'Green Sambal Papayam',
                          subtitle: 'Ayam Dengan Sambal Hijau khas Papayam',
                          price: '35.000',
                          imageUrl: 'assets/images/AyamSambalHijau.jpg'),
                      FoodItem(
                          title: 'Papayam Santan',
                          subtitle: 'Ayam santan Lezat dengan aroma yang manis',
                          price: '32.000',
                          imageUrl: 'assets/images/AyamSantan.png'),
                      FoodItem(
                          title: 'Paket Gemoy Papayam',
                          subtitle: 'Ayam papayam paket besar kenyang',
                          price: '142.000',
                          imageUrl: 'assets/images/PaketGemoy.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[700],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do you have a 70% off papayam coupon?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Promo period 14 - 18 Desember 2024',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/images/Ayam_Geprek_dashboard.png',
            width: 80,
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari yang kamu mau!',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }
}

//Data Menu
final List<FoodItem> foodItems = [
  const FoodItem(
    title: 'Nasi Goreng',
    subtitle: 'Nasi goreng spesial dengan topping ayam',
    price: 'Rp25.000',
    imageUrl: 'assets/images/nasi_goreng.jpg',
  ),
  const FoodItem(
    title: 'Mie Ayam',
    subtitle: 'Mie ayam kuah kental dengan bakso',
    price: 'Rp20.000',
    imageUrl: 'assets/images/mie_ayam.jpg',
  ),
  const FoodItem(
    title: 'Sate Ayam',
    subtitle: 'Sate ayam dengan bumbu kacang',
    price: 'Rp30.000',
    imageUrl: 'assets/images/sate_ayam.jpg',
  ),
  // Tambahkan item lainnya
];

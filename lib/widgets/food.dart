import 'package:flutter/material.dart';
import 'package:papayamshopdemo/pages/dashboard-neared.dart';
import 'package:papayamshopdemo/pages/payment.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(), // Memberi jarak agar elemen di kanan
        GestureDetector(
          onTap: () {
            // Navigasi ke halaman DashboardNeared
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardNeared()),
            );
          },
          child: const Text(
            'Lihat Lainnya',
            style: TextStyle(
              color: Colors.orange,
              fontWeight:
                  FontWeight.bold, // Tambahkan efek bold agar lebih menonjol
              decoration: TextDecoration
                  .underline, // Tambahkan garis bawah seperti tautan
            ),
          ),
        ),
      ],
    );
  }
}

class FoodGrid extends StatelessWidget {
  final List<FoodItem> foodItems;

  const FoodGrid({super.key, required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        final item = foodItems[index];
        return GestureDetector(
          onTap: () {
            // Pindah ke halaman pembayaran dengan membawa data menu yang dipilih
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentPage(item: item),
              ),
            );
          },
          child: FoodCard(item: item, title: '', subtitle: '', price: '', imageUrl: '',),
        );
      },
    );
  }
}

class FoodItem {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;

  const FoodItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
  });
}

class FoodCard extends StatelessWidget {
  final FoodItem item; // Ubah tipe parameter menjadi FoodItem

  const FoodCard({super.key, required this.item, required String title, required String subtitle, required String price, required String imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Image.asset(
              item.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  item.price,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

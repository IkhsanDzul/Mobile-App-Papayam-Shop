import 'package:flutter/material.dart';

void main() {
  runApp(const DashboardNeared());
}

class DashboardNeared extends StatefulWidget {
  const DashboardNeared({super.key});

  @override
  _DashboardNearedState createState() => _DashboardNearedState();
}

class _DashboardNearedState extends State<DashboardNeared> {
  String selectedTab = 'Rekomendasi';
  List<Map<String, String>> currentMenu = [];

  // Data menu
  final List<Map<String, String>> promoMenu = [
    {
      "title": "Green Sambal Papayam",
      "subtitle": "Ayam Dengan Sambal Hijau khas Papayam",
      "price": "Rp 35.000",
      "imageUrl": "assets/images/AyamSambalHijau.jpg",
    },
    {
      "title": "Sate Papayam",
      "subtitle": "Satay Ayam Dengan Bumbu Kacang yang Khas",
      "price": "Rp 20.000",
      "imageUrl": "assets/images/SateAyam.png",
    },
    {
      "title": "Papayam 7 elemen",
      "subtitle": "Ayam Khas dengan 7 varian rasa dalam 1 paket",
      "price": "Rp 135.000",
      "imageUrl": "assets/images/2.png",
    },
    {
      "title": "Papayam Bakar",
      "subtitle": "Ayam bakar dengan bumbu khas papayam",
      "price": "Rp 29.000",
      "imageUrl": "assets/images/AyamBakar.png",
    },
    {
      "title": "Papayam Geprek",
      "subtitle": "Ayam sambal geprek pedas yang menggugah selera",
      "price": "Rp 37.500",
      "imageUrl": "assets/images/AyamGprek.png",
    }
  ];

  final List<Map<String, String>> rekomendasiMenu = [
    {
      "title": "Papayam Bakar",
      "subtitle": "Ayam bakar dengan bumbu khas papayam",
      "price": "Rp 29.000",
      "imageUrl": "assets/images/AyamBakar.png",
    },
    {
      "title": "Sate Papayam",
      "subtitle": "Satay Ayam Dengan Bumbu Kacang yang Khas",
      "price": "Rp 20.000",
      "imageUrl": "assets/images/SateAyam.png",
    },
    {
      "title": "Papayam Paket Gemoy",
      "subtitle": "Ayam papayam paket besar kenyang",
      "price": "Rp 142.000",
      "imageUrl": "assets/images/PaketGemoy.png",
    },
    {
      "title": "Papayam 7 elemen",
      "subtitle": "Ayam Khas dengan 7 varian rasa dalam 1 paket",
      "price": "Rp 135.000",
      "imageUrl": "assets/images/2.png",
    },
    {
      "title": "Papayam Aceh",
      "subtitle": "Ayam dengan bumbu Aceh ramai rempah",
      "price": "Rp 39.000",
      "imageUrl": "assets/images/1.png",
    },
    {
      "title": "Papayam Rendang",
      "subtitle": "Ayam Papayam dengan bumbu rendang yang khas",
      "price": "Rp 40.000",
      "imageUrl": "assets/images/9.png",
    },
  ];

  final List<Map<String, String>> ulasanMenu = [
    {
      "title": "Paket Spesial",
      "subtitle": "Paket hemat favorit pelanggan",
      "price": "Rp 50.000",
      "imageUrl": "assets/images/PaketGemoy.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    currentMenu = rekomendasiMenu; // Default menu
  }

  void _onTabSelected(String tab) {
    setState(() {
      selectedTab = tab;
      if (tab == 'Promo') {
        currentMenu = promoMenu;
      } else if (tab == 'Rekomendasi') {
        currentMenu = rekomendasiMenu;
      } else if (tab == 'Ulasan') {
        currentMenu = ulasanMenu;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF8E1),
        body: SafeArea(
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 20),
              FilterTabs(
                selectedTab: selectedTab,
                onTabSelected: _onTabSelected,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FoodGrid(menu: currentMenu), // Kirim currentMenu
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Populer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Bekasi, Indonesia',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const Spacer(),
          
        ],
      ),
    );
  }
}

class FilterTabs extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;

  const FilterTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterTab(
            title: 'Promo',
            isSelected: selectedTab == 'Promo',
            onTap: () => onTabSelected('Promo'),
          ),
          FilterTab(
            title: 'Rekomendasi',
            isSelected: selectedTab == 'Rekomendasi',
            onTap: () => onTabSelected('Rekomendasi'),
          ),
          FilterTab(
            title: 'Ulasan',
            isSelected: selectedTab == 'Ulasan',
            onTap: () => onTabSelected('Ulasan'),
          ),
          const Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterTab({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class FoodGrid extends StatelessWidget {
  final List<Map<String, String>> menu;

  const FoodGrid({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final item = menu[index];
          return FoodCardTwo(
            title: item['title']!,
            subtitle: item['subtitle']!,
            price: item['price']!,
            imageUrl: item['imageUrl']!,
          );
        },
      ),
    );
  }
}

class FoodCardTwo extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;

  const FoodCardTwo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[400],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 250,
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
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  '$title telah ditambahkan ke keranjang')),
                        );
                      },
                      child:
                          const Icon(Icons.shopping_bag, color: Colors.orange),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

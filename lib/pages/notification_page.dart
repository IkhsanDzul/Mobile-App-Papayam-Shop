import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Selamat Datang di Papayam Shop..",
      "subtitle": "Temukan makanan favoritmu di Papayam Shop.",
      "content":"Terima Kasih karena telah datang ke acara Aesnovation 2024 SMKN 1 Kota Bekasi. Hopefully you've enjoyed your visit and had a great day.",
      "isRead": false,
    },
    {
      "title": "Promo diskon 50% hanya hari ini!",
      "subtitle": "Gunakan kode promo PAPAYAM50 untuk diskon spesial.",
      "content":"Dont forget to use the code PAPAYAM50 to get a special discount.",
      "isRead": false,
    },
    {
      "title": "Produk baru telah tersedia",
      "subtitle": "Lihat menu baru kami di aplikasi sekarang.",
      "content":"Menu Baru Telah Tersedia.. :  Ayam Mentah A5, Hot Plate, Mi Ayam Papayam, Papayam paket 7 elemen.. Dapatkan Sekarang juga...",
      "isRead": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Tombol kembali
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(
              notification['isRead'] ? Icons.notifications : Icons.notifications_active,
              color: notification['isRead'] ? Colors.grey : Colors.orange,
            ),
            title: Text(
              notification['title'],
              style: TextStyle(
                fontWeight: notification['isRead'] ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(notification['subtitle']),
            onTap: () {
              
              notifications[index]['isRead'] = true;

              // Tampilkan halaman detail notifikasi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationDetailPage(notification: notification),
                ),
              );
              
            },
          );
        },
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final Map<String, dynamic> notification;

  NotificationDetailPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Notifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              notification['subtitle'],
              style: const TextStyle(fontSize: 16),
            ),   
            const SizedBox(height: 16),
            Text(
              notification['content'],
              style: const TextStyle(fontSize: 16),
            )         
          ],
        ),
      ),
    );
  }
}
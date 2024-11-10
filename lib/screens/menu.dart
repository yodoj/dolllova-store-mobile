import 'package:flutter/material.dart';
import 'package:dollova_store/widgets/left_drawer.dart';
import 'package:dollova_store/widgets/product_card.dart';
class MyHomePage extends StatelessWidget {
  final String npm = '2306165692'; // NPM
  final String name = 'Nadira Aliya Nashwa'; // Nama
  final String className = 'PBP C'; // Kelas
  MyHomePage({super.key});
  // Buttons
  final List<ItemHomepage> items = [
      ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.purple[300]!),
      ItemHomepage("Tambah Produk", Icons.add, Colors.green[300]!),
      ItemHomepage("Logout", Icons.logout, Colors.redAccent),
     ];
@override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Dollova Store" dengan teks putih dan tebal.
        title: const Text(
          'Dollova Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: ListView(
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
             // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 22.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Dollova Store!',
                      style: TextStyle(
                        fontFamily: 'Poppins', 
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.pink,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
    drawer: const LeftDrawer(),
    );
  }
}

// Widget utama untuk menampilkan informasi tentang NPM, nama, dan kelas.
class InfoCard extends StatelessWidget {
  final String title; // Judul kartu.
  final String content; // Isi kartu.

  // Konstruktor untuk menerima nilai judul dan isi kartu yang akan ditampilkan.
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
       // Mengatur tampilan dari kartu.
      decoration: BoxDecoration(
        color: Colors.white, // Warna background
        border: Border.all(color: Colors.pink[200]!, width: 2), // Warna dan ketebalan garis
        borderRadius: BorderRadius.circular(8), // Sudut melengkung
      ), 
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5, // Lebar berdasarkan ukuran layar
        padding: const EdgeInsets.all(16.0), // Padding dalam kartu
        child: Column(
          // Widget yang disusun secara vertikal
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pink, // Warna teks merah untuk judul
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                color: Colors.purple, // Warna teks ungu untuk konten
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '1234567'; // NPM
  final String name = 'Dudul'; // Nama
  final String className = 'PBP X'; // Kelas
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

// Model yang mendefinisikan item pada halaman utama, berisi nama, ikon, dan warna.
class ItemHomepage {
    final String name; // Nama dari item yang akan ditampilkan
    final IconData icon; // Ikon untuk mewakili item
    final Color color; // Warna background item
    // Konstruktor untuk menerima nilai nama, ikon, dan warna item.
     ItemHomepage(this.name, this.icon, this.color);
 }

// Widget untuk menampilkan kartu dari item homepage yang dapat ditekan.
class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.
  final ItemHomepage item;   // Variabel item yang akan ditampilkan pada kartu.
  const ItemCard(this.item, {super.key}); // Konstruktor untuk menerima objek ItemHomepage yang akan digunakan.

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center, // Teks item ditampilkan di bawah ikon
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

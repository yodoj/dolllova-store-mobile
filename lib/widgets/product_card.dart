import 'package:flutter/material.dart';
import 'package:dollova_store/screens/productentry_form.dart';
import 'package:dollova_store/screens/login.dart';
import 'package:dollova_store/screens/list_productentry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
 final List<ItemHomepage> items = [
      ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.purple[300]!),
      ItemHomepage("Tambah Produk", Icons.add, Colors.green[300]!),
      ItemHomepage("Logout", Icons.logout, Colors.redAccent),
     ];
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
    final request = context.watch<CookieRequest>();
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () async{
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
          if (item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEntryFormPage(),
                )
            );
          }
          else if (item.name == "Lihat Produk") {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const ProductEntryPage()
                ),
            );
          }

          else if (item.name == "Logout") {
            final response = await request.logout(
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(message),
                        ),
                    );
                }
            }
          }
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

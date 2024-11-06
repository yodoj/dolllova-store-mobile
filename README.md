Nama: Nadira Aliya Nashwa

NPM : 2306165692

## ESSAY TUGAS 7: ELEMEN DASAR FLUTTER

**1. Jelaskan apa yang dimaksud dengan*state*less widget dan*state*ful widget, dan jelaskan perbedaan dari keduanya.**

*Stateless widget* adalah *widget* yang bersifat statis atau tidak akan berubah. Sedangkan *stateful widget* adalah *widget* yang bersifat dinamis atau dapat berubah. Berikut adalah perbedaannya:

1. *Stateless widget*
- Tidak memiliki *state*.
- Hanya berubah jika ada *external events* di *parent*.
- Biasanya digunakan untuk tampilan.

2. *Stateful widget*
- Ada *widget*state** yang menyertai.
- Selama *app* dijalankan, *state* berubah-ubah.
- Biasanya digunakan untuk menyimpan data *widget* tersebut.


**2.  Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

1. MaterialApp
- *Widget* utama yang menjadi *root* dari aplikasi *Flutter*.
- Mengatur tema, judul, dan *home* dari aplikasi.

2. Scaffold
- Memberikan struktur dasar untuk halaman, termasuk *AppBar, body*, dan elemen lainnya. 
- Memudahkan pengaturan *layout* halaman.

3. AppBar
- Menyediakan area di bagian atas layar untuk menampilkan judul aplikasi dan navigasi. 
- Menciptakan kesan yang konsisten di seluruh aplikasi.

4. Padding
- Memberikan *spacing* di sekitar *widget* lainnya.
- Memberikan *margin* di sekitar *body* halaman.

5. ListView
- Menampilkan daftar elemen secara vertikal yang dapat digulir.
- Mengakomodasi elemen yang mungkin lebih banyak dari yang dapat ditampilkan di layar.

6. Row
- Menyusun *child* secara horizontal. Dalam proyek ini, digunakan untuk menampilkan tiga InfoCard.

7. InfoCard
- Menampilkan informasi seperti NPM, nama, dan kelas.

8. SizedBox
- Memberikan *spacing* antara elemen.

9. Center
- Menempatkan teks dan *grid item* di tengah.

10. Text
- Menampilkan teks.

11. GridView
- Menampilkan *child** dalam bentuk *grid*. Dalam proyek ini, digunakan untuk menampilkan ItemCard dalam tiga kolom.

12. Container
- Mengatur *padding, margin*, dan memberikan warna atau dekorasi pada elemen.

13. BoxDecoration
- Memberikan warna *background, border*, dan sudut melengkung.

14. Material
-  Mengatur warna *background* dan sudut melengkung pada ItemCard.

15. InkWell
- Memberi efek gelombang ketika ditekan.
- Digunakan dalam ItemCard untuk merespons interaksi pengguna.

16. SnackBar
- Menampilkan pesan sementara di bagian bawah layar. 
- Digunakan untuk memberi *feedback* kepada pengguna saat ItemCard ditekan.

17. Icon
- Menampilkan ikon
- Digunakan dalam ItemCard untuk menampilkan ikon sesuai dengan item.


**3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

``setState()`` merupakan fungsi yang memperbarui suatu *state* ke objek komponen. Variabel yang terdampak yaitu:
- Semua variabel yang disimpan dalam *state*
- *Child* yang dipengaruhi oleh *state* di dalam komponen *parent*nya. 

Hal ini karena setiap kali ada perubahan pada satu atau lebih properti di dalam objek *state*, komponen akan di-*render* ulang dengan nilai-nilai *state* terbaru


**4. Jelaskan perbedaan antara const dengan final.**

1. *Const*
- *Const* merupakan variabel yang nilainya harus ditetapkan saat kompilasi dan tidak dapat diubah saat *runtime*. 
- *Const* digunakan saat nilainya diketahui saat kompilasi dan tidak pernah berubah. Biasanya digunakan untuk *widget* yang *static*

2. *Final*
- *Final* merupakan variabel yang nilainya dapat ditetapkan saat *runtime*, tetapi setelah ditetapkan nilainya tidak dapat diubah.
- *Final* harus digunakan secara *default* untuk setiap variabel yang baru ditentukan untuk menghindari penetapan ulang variabel yang tidak diinginkan.
 

**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

Untuk mengimplementasikan semua *checklist*, pastikan telah menginstall *Flutter* di laptop. Disini, saya membuat sebuah program *Flutter* baru bernama *Dollova Store* yang menjual beberapa produk boneka. Untuk itu, saya membuat proyek  *Flutter* dollova_store dengan menjalankan *command* berikut di direktori di mana saya menyimpan proyek *Flutter*.

```flutter create dollova_store```

Kemudian saya membuat 3 *buttons* yaitu "Lihat Daftar Produk" yang bewarna ungu muda, "Tambah Produk" bewarna hijau muda, dan "Logout" yang bewarna merah terang dengan membuat *list of* ``ItemHomepage`` yang saya tambahkan pada *class* ``ItemHomepage``. Berikut adalah potongan kodenya pada menu.dart:

```
final List<ItemHomepage> items = [
      ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.purple[300]!),
      ItemHomepage("Tambah Produk", Icons.add, Colors.green[300]!),
      ItemHomepage("Logout", Icons.logout, Colors.redAccent),
     ];
```

Sebelumnya, saya telah membuat *class* bernama  ``ItemHomepage`` di menu.dart yang berisi atribut-atribut dari *buttons*. Disini atributnya adalah nama, ikon, dan warna. 

```
// Model yang mendefinisikan item pada halaman utama, berisi nama, ikon, dan warna.
class ItemHomepage {
    final String name; // Nama dari item yang akan ditampilkan
    final IconData icon; // Ikon untuk mewakili item
    final Color color; // Warna background item
    // Konstruktor untuk menerima nilai nama, ikon, dan warna item.
     ItemHomepage(this.name, this.icon, this.color);
 }
 ```

Agar warna-warna yang berbeda pada setiap *button* dapat dilihat pada web, saya menambahkan potongan kode ini di menu.dart.
```
@override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      ...
```
Pada kode ini, ``item.color`` berfungsi nuntuk menentukan warna *background* dari *widget* Material seperti warna pada *buttons* yang berbeda-beda.

Untuk memuculkan *snackbar* setiap kali *button* ditekan, saya menambahkan potongan kode berikut ini pada menu.dart:

```
  @override
  Widget build(BuildContext context) {
    return Material(
      ...
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
        ...
```
Pada kode ini, ``item.name`` berisi nama *button* ada di web sehingga pesan pada *snackbar* akan muncul sesuai *button* yang ditekan.

### Referensi

Gerken, M. (2022, December 6). Static, final, const, dynamic, var - differences and similarities. Flutter Clutter. Retrieved November 5, 2024, https://www.flutterclutter.dev/flutter/basics/2022-12-06-static-final-const-dynamic-var/ 

State komponen. React. (n.d.). Retrieved November 5, 2024, https://id.legacy.reactjs.org/docs/faq-state.html 

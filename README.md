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


## ESSAY TUGAS 8: Flutter Navigation, Layouts, Forms, and Input Elements

**1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**

Fungsi *const* di Flutter adalah untuk menunjukkan bahwa suatu nilai atau *widget* bersifat konstan atau tidak berubah. Keuntungan dari penggunaan *const* adalah mengurangi penggunaan memori, performa lebih baik, dan aplikasi lebih responsif. *Const* digunakan ketika nilai variabel diketahui saat waktu kompilasi dan nilainya tidak pernah berubah, seperti pada widget *text, icon, container, color.*

**2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**

*Row* dan *column* berguna untuk mengatur tata letak di dalam aplikasi. *Row* digunakan untuk menyusun *widget* secara horizontal dan *column* digunakan untuk menyusun *widget* secara vertikal. Berikut contoh implementasinya.

**Contoh implementasi *row***
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('images/pic1.jpg'),
    Image.asset('images/pic2.jpg'),
    Image.asset('images/pic3.jpg'),
  ],
);
```
Pada kode ini, gambar akan disusun secara horizontal dari kiri ke kanan.

**Contoh implementasi *column***

```
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('images/pic1.jpg'),
    Image.asset('images/pic2.jpg'),
    Image.asset('images/pic3.jpg'),
  ],
);
```
Pada kode ini, gambar akan disusun secara vertikal dari atas ke bawah.

**3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**

Elemen *input* yang saya gunakan untuk tugas ini adalah `TextFormField` yang digunakan untuk menerima data produk, deskripsi, harga, dan *stock*. Adapun elemen *input* Flutter lain yang tidak saya gunakan untuk tugas ini adalah:
1. `DropdownButtonFormField`, biasanya menmapilkan beberapa opsi yang dapat dipilih pengguna.

2. `Checkbox`, *input* berupa pilihan yang dapat dipilih lebih dari 1 opsi.

3. `Radio `, *input* berupa pilihan ganda.

4. `Switch`, *input* pilihan yang bersifat *on/off.*

5. `DatePicker` atau `TimePicker`, *input* untuk memilih tanggal atau waktu.

6. `Slider`, *input* untuk memilih nilai dalam rentang tertentu.

**4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**

Untuk mengatur tema dalam aplikasi Flutter agar tampilannya konsisten, saya menggunakan ThemeData yang didefinisikan secara global di file main.dart. Pada aplikasi Dollova Store, saya mengatur warna tema utama menjadi warna pink agar sesuai dengan konsep aplikasi yang saya buat. Untuk mengimplementasikan tema, saya melakukan *import material dart* pada file-file yang saya buat .

`import 'package:flutter/material.dart';`

Untuk mengatur tampilan warna agar sesuai tema, saya gunakan kode berikut:

`Theme.of(context).colorScheme.primary,`

**5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**

Untuk mengimplementasikan hal tersebut, saya menggunakan *drawer menu*, yaitu menu yang muncul di sisi kiri layar yang berisi navigasi ke halaman lain. Jadi saya membuat left_drawer.dart dan mengimport halaman-halaman yang ingin dinavigasi, dalam hal ini, saya menambahkan navigasi ke `MyHomePage` dan `ProductEntryFormPage`. Lalu saya melakukan *routing* agar halaman-halaman tersebut dapat terakses. 

Berikut kode untuk *routing* ke `MyHomePage`:

```
onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
  )
```

Berikut kode untuk *routing* ke `ProductEntryFormPage`:

```
 Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEntryFormPage(),
                )
            );
```
### Referensi

Collins, K. (2021, July 7). The flutter “const” keyword demystified. Medium. Retrieved November 10, 2024, https://medium.com/flutter-community/the-flutter-const-keyword-demystified-c8d2a2609a80 

Layouts in flutter. Flutter. (n.d.). Retrieved November 10, 2024, https://docs.flutter.dev/ui/layout 

## ESSAY TUGAS 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

**1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**

Membuat model untuk pengambilan atau pengiriman data JSON itu penting karena model membantu memastikan struktur dan format data selalu konsisten. Dengan model, kita bisa memvalidasi data, menangkap *error* lebih cepat, dan mempermudah pengelolaan data kompleks. Jika tidak membuat model, risiko terjadi *error* seperti data tidak sesuai format, field hilang, atau tipe data salah jadi lebih besar.

**2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**

*Library http* ini berfungsi untuk melakukan *HTTP Request,*, mengirimkan data ke *server*, mengambil respons dari *server*, Pada tugas ini, berguna untuk mengambil daftar produk dan menyimpan produk baru ke server.

**3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter**

*CookieRequest* berfungsi  untuk menangani autentikasi berbasis cookie dalam aplikasi Flutter, terutama untuk berkomunikasi dengan server Django. *CookieRequest* perlu untuk dibagikan ke semua komponen di aplikasi Flutter karena setiap bagian aplikasi dapat memanfaatkan informasi autentikasi yang sama.

**4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**

Pengguna memasukkan data di form Flutter.Kemudian data  dikirim ke server menggunakan *HTTPRequest* dalam format JSON. Lalu  Django menerima, memverifikasi, dan menyimpan data ke *database*. Data diambil kembali melalui *request* GET oleh Flutter. Lalu data ditampilkan di aplikasi.

**5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

Pada *register*, pengguna mengirim data pendaftaran melalui Flutter lalu Django membuat akun dan menyimpan data ke *database*. Flutter menerima konfirmasi bahwa pendaftaran berhasil. Kemudian pada login, Flutter mengirim data login ke Django. Untuk menampilkan menu, Flutter menggunakan *cookie* sesi untuk mengakses data lain dari *server*. Data ditampilkan di aplikasi sesuai dengan sesi pengguna. Jika ingin logout, Flutter mengirimkan *request* logout ke Django. Django menghapus sesi pengguna.

**6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

Untuk mengimplementasikan register, saya menambahkan fungsi register  di views.py pada Django. Kemudian saya membuat file register.dart pada Flutter. Disini, saya menggunakan http.post untuk mengirim data ke Django. Untuk membuat login, saya menambahkan fungsi login di views.py lalu membuat file login.dart di Flutter. Untuk mengintegrasikan autentikasi antara Flutter dan Django, saya membuat *Django app* bernama *authentication*. Kemudian menggunakan CookieRequest untuk semua request setelah login. Membuat model kustom sesuai dengan proyek aplikasi Django, saya menggunakan *website* Quicktype. Pada tahap ini, saya menyesuaikan data dengan JSON. Dalam membuat halaman yang berisi daftar semua item, saya membuat file list_productentry.dart yang dapat menampilkan daftar
produk yang juga menampilkan nama, harga, dan dekripsi. Dalam membuat halaman detail item, saya menambahkan navigasi dari daftar item ke halaman detail. Untuk menambahkan filter item berdasarkan pengguna, saya menambahkan filter di *endpoint* Django. 

### Referensi

A., F. (2024, November 15). Apa Itu Cookies? Arti Dan Fungsi cookies pada browser. Hostinger Tutorial. Retrieved November 20, 2024, https://www.hostinger.co.id/tutorial/cookies-adalah 

Kagel, A. (n.d.). What is the relation between a data format like JSON and a relational model? how can I convert between them?. Quora. Retrieved November 20, 2024, https://www.quora.com/What-is-the-relation-between-a-data-format-like-JSON-and-a-relational-model-How-can-I-convert-between-them 
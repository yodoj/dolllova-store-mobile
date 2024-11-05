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
- Widget utama yang menjadi root dari aplikasi Flutter.
- Mengatur tema, judul, dan home dari aplikasi.

2. Scaffold
- Memberikan struktur dasar untuk halaman, termasuk AppBar, body, dan elemen lainnya. 
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

setState() merupakan fungsi yang memperbarui suatu *state* ke objek komponen. Variabel yang terdampak yaitu:
- Semua variabel yang disimpan dalam *state*
- *Child* yang dipengaruhi oleh *state* di dalam komponen *parent*nya. 

Hal ini karena setiap kali ada perubahan pada satu atau lebih properti di dalam objek *state*, komponen akan di-*render* ulang dengan nilai-nilai *state* terbaru

4. Jelaskan perbedaan antara const dengan final.
 
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

https://id.legacy.reactjs.org/docs/faq-state.html
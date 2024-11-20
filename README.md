# Depok Keebs
Mau keyboard yang tak hanya enak dilihat tapi juga enak dipakai? Depok Keebs siap mewujudkan keyboard impianmu. Ucapkan selamat tinggal pada keyboard standar dan mulailah menciptakan pengalaman mengetik yang berbeda dengan kami.


<details>
<summary> <b> Tugas 7: Elemen Dasar Flutter </b> </summary>

    
## **Pertanyaan 1**  
**Step-by-step implementasi checklist Tugas 7:**

1. Untuk memulai membuat project Flutter, saya membuat direktori di lokal bernama `depok_keebs_mobile` dan menjalankan `flutter create depok_keebs` lalu change directory ke `depok_keebs`
2. Kemudian, saya membuat `menu.dart` di `depok_keebs/lib` untuk merapikan struktur proyek dan memindahkan sebagian kode dari `main.dart`
3. Selanjutnya untuk membuat tombol sederhana, saya membuat class `ItemHomepage` yang menyimpan properti tiap tombol:
   ```dart
   class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;
  
    ItemHomepage(this.name, this.icon, this.color);
   }
   ```
    dan `ItemCard` untuk menampilkan tombol:
    ```dart
      class ItemCard extends StatelessWidget {
        final ItemHomepage item;
      
        const ItemCard(this.item, {super.key});
      
        @override
        Widget build(BuildContext context) {
          return Material(
            color: item.color, // Mengatur warna latar belakang sesuai item
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                  );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
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
                        textAlign: TextAlign.center,
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
    ```
    kemudian, ketiga tombol disimpan di list `items` dengan parameter color agar ketiga tombol memiliki warna berbeda:
    ```
    final List<ItemHomepage> items = [
      ItemHomepage("Lihat Daftar Produk", Icons.keyboard, Color(0xFF71C9CE)),
      ItemHomepage("Tambah Produk", Icons.add, Color(0xFFA6E3E9)),
      ItemHomepage("Logout", Icons.logout, Color(0xFFE84545)),
    ];
    ```
4. Untuk memunculkan Snackbar "Tombol telah ditekan", saya menggunakan ScaffoldMessenger di `ItemCard`:
   ```dart
     onTap: () {
    // Menampilkan SnackBar ketika tombol ditekan
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar() // Menghilangkan SnackBar sebelumnya jika ada
      ..showSnackBar(
        SnackBar(
          content: Text("Kamu telah menekan tombol ${item.name}!"),
          duration: Duration(seconds: 2), // Durasi tampil 2 detik
        ),
      );
      },
    ```
   `showSnackBar()` menampilkan SnackBar baru dengan teks "Kamu telah menekan tombol ${item.name}!" sesuai nama tombol yang ditekan.
5. Terakhir, saya melakukan add-commit-push ke repository Github.



  


## **Pertanyaan 2**  
**Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya:**

**Stateless Widget**: Widget yang tidak memiliki state (data yang bisa berubah). Tampilan dan data di dalamnya tetap sama sepanjang waktu. Contoh: teks atau ikon statis. Menggunakan StatelessWidget.

**Stateful Widget**: Widget yang memiliki state dan bisa berubah selama aplikasi berjalan. Cocok untuk elemen yang perlu memperbarui UI berdasarkan interaksi atau data dinamis. Contoh: tombol yang bisa diubah warnanya saat ditekan, atau form yang menerima input. Menggunakan StatefulWidget.


## **Pertanyaan 3**  
**Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.:**

Scaffold: Struktur dasar halaman, menyediakan kerangka untuk AppBar dan body.
AppBar: Menampilkan judul di bagian atas aplikasi ("Depok Keebs").
Padding: Memberikan jarak di sekitar widget.
Column: Menyusun widget secara vertikal.
Row: Menyusun widget secara horizontal.
Text: Menampilkan teks statis.
Card: Menampilkan informasi dalam bentuk kartu (digunakan di InfoCard).
Container: Membungkus widget lain dan bisa diatur ukuran, padding, dan warnanya.
GridView: Menampilkan ItemCard dalam bentuk grid (tiga kolom).
InkWell: Membuat widget responsif terhadap sentuhan, memicu SnackBar saat ditekan.
SnackBar: Menampilkan pesan sementara di bagian bawah layar.
Icon: Menampilkan ikon sesuai item.icon.


## **Pertanyaan 4**  
**Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut:**

`setState()` adalah fungsi dalam Stateful Widget yang digunakan untuk memberitahu Flutter bahwa ada perubahan pada state widget, sehingga widget perlu di-render ulang dengan data terbaru. Fungsinya mengupdate tampilan UI setiap kali ada perubahan pada variabel yang berada dalam State. Untuk variabel yang terdampak, hanya variabel dalam class State yang akan ter-update dan memengaruhi tampilan UI saat setState() dipanggil. Biasanya variabel ini adalah data yang bisa berubah, seperti teks, warna, posisi, atau kondisi logika dalam widget.


## **Pertanyaan 5**  
**Jelaskan perbedaan antara const dengan final.:**

const: Nilai ditentukan saat kompilasi dan tidak bisa berubah selamanya. Digunakan untuk nilai yang benar-benar konstan. Contoh: `const pi = 3.14;`
final: Nilai ditentukan saat runtime dan tidak bisa diubah setelah pertama kali diinisialisasi. Cocok untuk nilai yang tidak diketahui saat kompilasi tetapi tetap setelah di-set. Contoh: `final date = DateTime.now();`

</details>

<details>
<summary> <b> Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements </b> </summary>


## **Pertanyaan 1**  
**Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan:**

`const` di Flutter digunakan untuk membuat objek yang tidak berubah (immutable) dan sudah diketahui nilainya saat kompilasi. Keuntungan memakai `const` adalah aplikasi jadi lebih efisien karena objek tidak perlu dibuat ulang saat rebuild, sehingga menghemat memori dan meningkatkan performa. `const` sebaiknya digunakan untuk widget atau nilai tetap, tapi hindari saat data berubah secara dinamis.


## **Pertanyaan 2**  
**Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini:**

`Column` dan `Row` adalah widget layout di Flutter yang digunakan untuk menyusun widget secara vertikal (ke bawah) dan horizontal (ke samping). Column cocok dipakai saat ingin menampilkan elemen-elemen secara bertumpuk ke bawah, misalnya teks dan ikon dalam `ItemCard`. Pada `Column`, properti seperti `mainAxisAlignment` dan `crossAxisAlignment` digunakan untuk mengatur posisi widget di sepanjang sumbu vertikal dan horizontal.

Sementara itu, `Row` digunakan untuk menyusun widget secara horizontal, ideal untuk menampilkan elemen-elemen yang perlu disejajarkan ke samping, seperti ikon dan teks dalam satu baris. Properti `mainAxisAlignment` dan `crossAxisAlignment` pada `Row` berfungsi untuk mengatur tata letak widget di sepanjang sumbu horizontal dan vertikal.

Contoh `Column` yang ada di `product_card.dart`:
```dart
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.keyboard, size: 50, color: Colors.blue),
        Text("Depok Keebs"),
      ],
    )
```
Contoh `Row`:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.add, color: Colors.blue),
    Text("Tambah Produk"),
  ],
)
```


## **Pertanyaan 3**  
**Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan:**

`TextFormField` - digunakan untuk input nama produk, deskripsi, dan jumlah produk. Masing-masing `TextFormField` memiliki validator untuk memastikan data diisi dengan benar, seperti memastikan nama dan deskripsi tidak kosong serta jumlah produk adalah angka positif.
Ada beberapa elemen input di Flutter yang tidak digunakan dalam tugas ini, di antaranya:
-`Checkbox` - untuk input yang membutuhkan pilihan ya/tidak.
-`Switch` - alternatif lain untuk pilihan ya/tidak yang lebih modern.
-`Radio` - untuk pilihan tunggal dari beberapa opsi.
-`DropdownButton` - untuk memilih satu nilai dari daftar opsi.
-`Slider` - untuk memilih nilai dalam rentang tertentu, cocok untuk input kuantitatif yang lebih intuitif.


## **Pertanyaan 4**  
**Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?:**

Untuk mengatur tema dalam aplikasi Flutter agar tampilannya konsisten, saya menggunakan `ThemeData` pada `MaterialApp` untuk menetapkan gaya global. Di sini, saya mendefinisikan `colorScheme` menggunakan `ColorScheme.fromSwatch`, termasuk warna utama (`primarySwatch`) dengan beberapa shade dan warna sekunder (`secondary`). Pengaturan ini memastikan warna aplikasi seragam di seluruh widget tanpa perlu mengatur warna secara manual pada setiap elemen.

Pada aplikasi yang saya buat, tema sudah diimplementasikan dengan baik. Penggunaan `Theme.of(context).colorScheme` pada widget tertentu, seperti `AppBar` dan `DrawerHeader`, juga memanfaatkan tema ini untuk tampilan yang konsisten. Selain itu, dengan mengaktifkan `useMaterial3: true`, aplikasi memanfaatkan elemen desain Material 3, memberikan kesan modern dan lebih rapi pada antarmuka.


## **Pertanyaan 5**  
**Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter:**

Untuk menangani navigasi dalam aplikasi Flutter dengan banyak halaman, saya menggunakan `Navigator` dan `MaterialPageRoute`. `Navigator` memungkinkan untuk berpindah halaman dengan metode `push` (menambahkan halaman baru di atas stack) dan `pop` (kembali ke halaman sebelumnya). Setiap halaman ditangani dengan `MaterialPageRout`e, yang menentukan rute baru ketika kita berpindah ke halaman tertentu.

Jika aplikasi memiliki struktur rute yang lebih kompleks, saya juga dapat mendefinisikan rute di dalam `MaterialApp` dengan properti `routes`. Dengan ini, setiap halaman memiliki nama unik yang bisa dipanggil kapan saja menggunakan `Navigator.pushNamed` atau `Navigator.pop`. Untuk aplikasi besar dengan banyak halaman, kita bisa mempertimbangkan menggunakan package seperti `flutter_modular` atau `go_router` untuk manajemen navigasi yang lebih terstruktur dan dinamis.

</details>

<details>
<summary> <b> Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter </b> </summary>


## **Pertanyaan 1**  
**Step-by-step implementasi checklist Tugas 9:**

1. Saya menjalankan `python manage.py runserver` di direktori proyek Django untuk memastikan proyek Django saya masih berjalan dengan lancar
2. Untuk mengimplementasi fitur registrasi, saya membuat `register.dart` di direktori flutter `lib/screens/`. Saya memakai TextFormField sebagai wadah input text seperti username dan password
3. Sama halnya dengan register, saya membuat `login.dart` di direktori flutter `lib/screens/`.
4. Kemudian, di direktori proyek Django saya menjalankan `pip install django-cors-headers` untuk menginstall library yang dibutuhkan, kemudian menambahkan `corsheaders` ke `INSTALLED_APPS` di `settings.py` direktori proyek Django dan menambahkan beberapa variabel.
5. Saya membuat app baru di proyek Django bernama `authentication` dengan path url master `localhost:8000/auth/` yang nantinya akan terintegrasi dengan sistem autentikasi pada Flutter
6. Implementasi fungsi register, login, dan logout di views `authentication` kemudian routing URL nya
7. Kemudian di direktori proyek Flutter, saya menginstall `provider` dan `pbp_django_auth` sebagai perantara kontak dengan web service Django.
8. Implementasikan `CookieRequest` ke `main.dart`.
9. Berkas `register.dart` dan `login.dart` yang tadi telah dibuat sekarang akan dihubungkan dengan `postJson` untuk register ke URL web Django yang terkait.
10. Untuk membuat model kustom, saya menggunakan QuickType untuk mengubah JSON yang saya dapat di endpoint `/json` pada web Django saya menjadi suatu model kustom dart.
11. Model ini saya namai `Product` dan saya letakkan di `lib/models/`.
12. Untuk membuat halaman yang menampilkan seluruh produk yang ada, saya membuat `list_product.dart` di `lib/screens/` yang akan menampilkan seluruh produk yang telah difetch berdasarkan usernya. Saya hanya menampilkan 3 attribute yaitu `name`, `price`, dan `description` di landing page halaman list produk ini.
13. Untuk membuat halaman detail yang menampilkan attribute lengkap dari produk, saya membuat `product_detail.dart` di `lib/widgets/`.
14. Untuk mengimplementasikan halaman detail, tambahkan navigasi ke halaman list produk dengan `Navigator.push` di `onTap` pada `ItemCard` untuk "Lihat Daftar Produk." Kemudian, pada halaman list produk, bungkus setiap item dalam `GestureDetector` yang memanggil `Navigator.pus`h ke halaman detail produk sambil mengirim data produk. Di halaman detail produk, tampilkan semua atribut produk dari model dengan widget seperti `Text` dan tambahkan tombol "Kembali" menggunakan `Navigator.pop` untuk kembali ke daftar produk.


## **Pertanyaan 2**  
**Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu:**

Membuat model untuk pengambilan atau pengiriman data JSON penting karena model bertindak sebagai representasi terstruktur dari data yang digunakan dalam aplikasi. Model memberikan konsistensi, sehingga data yang diterima dari JSON atau dikirim ke server dapat diakses dan dimanipulasi dengan cara yang lebih terorganisir dan mudah dipahami. Selain itu, model memungkinkan kita untuk memvalidasi data agar sesuai dengan format dan tipe yang diharapkan, seperti memastikan harga berupa angka atau nama produk tidak kosong, sehingga mencegah error yang mungkin terjadi akibat data yang tidak sesuai.

Jika kita tidak membuat model terlebih dahulu, aplikasi mungkin tetap dapat berfungsi, tetapi akan lebih sulit untuk mengelola dan memanipulasi data. Sebagai contoh, tanpa model, data hanya tersedia dalam bentuk map atau objek mentah yang rentan terhadap kesalahan akses (e.g., salah pengetikan key). Selain itu, proses debugging menjadi lebih sulit karena tidak ada struktur yang jelas untuk memeriksa data yang diterima atau dikirim. Dengan model, kita juga bisa memastikan kompatibilitas antara data frontend dan backend, membuat pengembangan lebih efisien dan mudah dipelihara.


## **Pertanyaan 3**  
**Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini:**

Library http dalam tugas ini berfungsi sebagai alat untuk melakukan komunikasi antara aplikasi Flutter dengan backend melalui protokol HTTP. Library ini memungkinkan aplikasi untuk mengirimkan permintaan (requests) seperti GET, POST, PUT, atau DELETE ke server, serta menerima respon berupa data, yang biasanya berformat JSON, untuk diolah lebih lanjut dalam aplikasi.

Dalam tugas ini, http digunakan untuk mengambil data produk dari server (menggunakan metode GET), sehingga aplikasi dapat menampilkan daftar produk secara dinamis berdasarkan data yang ada di backend. Selain itu, library ini juga digunakan untuk mengirim data (seperti menambah produk baru melalui metode POST), sehingga aplikasi dapat berinteraksi dengan server untuk memperbarui atau mengubah data. Dengan kata lain, library http menjadi jembatan utama yang memungkinkan integrasi antara aplikasi Flutter dan sistem backend.


## **Pertanyaan 4**  
**Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter:**

CookieRequest adalah sebuah kelas yang digunakan untuk mengelola sesi dan autentikasi berbasis cookie di aplikasi Flutter, khususnya saat berinteraksi dengan backend. Fungsinya mencakup pengiriman HTTP request (seperti GET dan POST) sambil menyimpan dan menyertakan cookie yang diterima dari server pada setiap permintaan. Cookie ini digunakan untuk menjaga status sesi pengguna (misalnya, login tetap aktif) dan memberikan otorisasi pada endpoint yang memerlukan autentikasi.
Perlu dibagikan ke semua komponen di aplikasi karena sesi pengguna sering kali digunakan secara global di seluruh aplikasi, seperti untuk memastikan bahwa permintaan ke API memiliki autentikasi yang valid. Dengan membagikan instance yang sama, aplikasi dapat mempertahankan status sesi yang konsisten tanpa perlu menginisialisasi ulang atau kehilangan data cookie di antara komponen. Hal ini juga memudahkan akses ke fungsi-fungsi seperti login, logout, atau pengiriman data dengan autentikasi, sehingga meningkatkan efisiensi dan kepraktisan dalam pengelolaan state aplikasi.


## **Pertanyaan 5**  
**Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter:**

Pengguna memasukkan data melalui widget input, yang disimpan dalam state. Data dikirim ke backend menggunakan HTTP (POST/PUT), lalu backend memproses dan menyimpannya di database. Aplikasi mengambil data kembali dari backend (GET), mengubahnya menjadi model, dan menampilkannya di UI Flutter.


## **Pertanyaan 6**  
**Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter:**

Login : Pengguna memasukkan username dan password, data dikirim ke backend Django melalui CookieRequest. Backend memverifikasi kredensial; jika valid, cookie sesi dikembalikan. Flutter menampilkan pesan sukses dan mengarahkan ke MyHomePage, atau menampilkan dialog error jika gagal. Pengguna juga dapat pindah ke halaman registrasi melalui tautan.

Register : Pengguna mengisi username, password, dan confirm password di form. Data dikirim ke backend Django melalui postJson. Django memvalidasi data (username unik, password sesuai) dan menyimpannya jika valid. Jika berhasil, Flutter menampilkan pesan sukses dan mengarahkan ke halaman login; jika gagal, menampilkan pesan error.

Logout : Flutter mengirim request ke backend Django melalui request.logout dengan URL endpoint /auth/logout/. Backend memproses permintaan dan menghapus sesi autentikasi. Jika logout berhasil, Flutter menampilkan pesan sukses menggunakan SnackBar dan mengarahkan pengguna kembali ke halaman login. Jika gagal, pesan error ditampilkan melalui SnackBar.


</details>

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

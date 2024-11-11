# biiluved

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<details>
  <summary><b>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</b></summary>
  
### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
 Jawaban:
`const` digunakan untuk menentukan sebuah objek/widget yang tidak akan berubah selama aplikasi berjalan.

#### Keuntungan menggunakan `const`: 
1) Optimiasasi Performa: `const` memungkinkan object hanya untuk dibuat sekali dan nnatinya dapat digunakan kembali. Hal tersebut dapat mengurangi konsumsi memori dan membuat rendering lebih efisien.
2) Keamanan Code: `const` berarti bahwa nilai tidak akan berubah. Hal tersebut dapat menghindari perubahan yang tidak disengaja serta mengurangi kemungkinan untuk `bug`.
3) Konsistensi: `const` dapat memberikan stabilitas pada kode karena nilai akan bersifat tetap. Selain itu, hal tersebut juga meningkatkan keterbacaan dan pemahaman kode.

#### Kapan menggunakan `const`:
1) Saat nilai diketahui dalam waktu kompilasi
2) Saat menggunakan widget yang statis (stateless widget)
3) Untuk mendeklarasikan konstanta di dalam kelas

#### Kapan jangan menggunakan `const`:
1) Saat nilai dihitung pada runtime
2) Saat mendapatkan nilai dari sumber eksternal
  
### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Jawaban:
#### Column 
`column` digunakan untuk menyusun widget secara vertikal
contoh dalam code: 
``` dart 
Column(
  children: [
    Text(title),
    const SizedBox(height: 8.0),
    Text(content),
  ],
)
```

#### Row
`row` digunakan untuk menyusun widget secara horizontal
cotoh dalam code:
``` dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name), 
    InfoCard(title: 'Class', content: className),
  ],
)
```
  
### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Jawaban: 

Elemen input yang digunakan untuk halaman form kali ini ialah `TextFormField`. Field tersebut digunakan untuk input `Product Name`, `Amount`, dan `Description`.

Selain itu, masih ada beberapa elemen yang tidak digunakan:
1) `DropdownButton`: utuk memilih opsi dari beberapa pilihan dalam bentuk dropdown
2) `Checkbox`: untuk pilihan yang bisa dicentang
3) `Switch`: mirip dengan Checkbox, tetapi tampilannya berupa saklar.
4) `Radio Button`: untuk memilih satu opsi dari beberapa pilihan

### 7. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Jawaban:

Theme telah diatur dalam `ThemeData` dalam widget `MaterialApp`. Saya juga teah menggunakan `ColorSchenme.fromSwatch` untuk mengatur warna-warna pada theme. 

``` dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
  ).copyWith(secondary: Colors.pinkAccent[100]),
  useMaterial3: true,
)
```
### 9. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Jawaban:

#### Navigator.push
Saya menggunakan `navigator.push` pada widget `ItemCard`. Navigasi dilakukan saat pengguna menekan tombol `Add LUVS`. `Navigator.push` digunakan menambah halaman baru di atas halaman saat ini dan memungkinkan pengguna untuk kembali ke halaman sebelumnya (back button) 

``` dart
onTap: () {
  if (item.name == "Add LUVs") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductFormPage(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
      );
  }
}
```

#### Navigator.pushReplacement
Saya menggunakan ini pada `LeftDrawer` untuk mengganti halaman saat ini dengan halaman baru. Seperti memilih `Home` dan `Add LUVs` dari drawer. 

``` dart
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
  },
),
ListTile(
  leading: const Icon(Icons.add),
  title: const Text('Add LUVs'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductFormPage(),
      ),
    );
  },
),
```
</details>

<details>
  <summary><b>Tugas 7: Elemen Dasar Flutter</b></summary>

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Jawaban:
`Stateless widget`merupakan suatu widget statis yang seluruh konfigurasinya telah diinisiasi dari awal. Stateless widget tidak memmiliki state (keadaan yang berubah). Contohnya ialah `Text, Icon, IconButton`.

Di lain sisi, stateful widget merupakan suatu widget yang bersifat dinamis sehingga widget dapat diperbarui sesuai dengan user actions atau jika terjadi perubahan data. Conthnya ialah `Checkbox, Radio, Textfield`.

Perbedaan utama dari stateless widget dan stateful widget ialah stateless widget bersifat statis, sedangkan stateful widget bersifat dinamis.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Jawaban: Beberapa widget yang digunakan di proyek ini ialah:
- Scaffold: Digunakan untuk memberikan dasar dari aplikasi, seperti `appBar`, `body`, dan `bottomNavigationBar`
- AppBar: Digunakan untuk menampilkan bagian atas halaman yang biasanya berisi judul aplikasi dan aksi penting.
- Column dan Row: Digunakan untuk menyusun widget secara vertikal (dengan `column`) dan horizontal (`row`)
- Text: Digunakan untuk menampilkan teks statis
- GridView: Digunakan untuk menyusun item dalam bentuk grid ataupun tabel
- Card: Digunakan untuk menampilkan konten dalam bentuk kartu agar lebih terstruktur
- InkWell: Digunakan untuk menyediakan efek klik dengan animasi untuk menambah interaksi pada item.
- InfoCard: Merupakan widget custom untuk menampilkan informasi berupa NPM, nama, dan kelas.
- ItemCard: Merupakan widget cutom untuk menampilkan ikon dan nama item dalam produk.


### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut
Jawaban:
`setState()` merupakan fungsi yang digunakan pada Stateful Widget. Fungsi ini digunakan untuk memperbarui state dan membangun kembali widget yang ada untuk memberikan data terbaru. 

Contoh variabel yang berdampak dalam `setState()`:
- `items`: `setState()` akan diperlukan untuk memperbarui tampilan GridView dengan daftar terbaru dalam ItemHomepage
- `npm, name, className`: `setState()` digunakan untuk menampilkan data baru.

### 4. Jelaskan perbedaan antara const dengan final.
Jawaban:
- `const` digunakan untuk membuat nilai variabel menjadi konstan saat di kompilasi. Nilai ii tidak bisa diubah saat kompilasi maupun runtime. const biasanya digunakan untuk data yang sudah diketahui dan tetap dari awal. 

- `final` digunakan untuk variabel yang nilainya ditetapkan satu kali dan tidak dapat diubah lagi. final dapat menerima nilai saat di runtime.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
Jawaban:
1) Membuat aplikasi flutter terlebih yang bernama biiluved, lalu membuat file faru bernama `menu.dart` dalam `biiluved/lib`
2) Memindahkan `MyHomePage` ke `menu.dart`. Lalu, menghapus class state yang berada di `main.dart` dan menambahkan import `menu.dart` ke file tersebut.
3) Mengubah widget halaman di `menu.dart` menjadi Stateless. Lalu, membuat tombol-tombol dan pengaturan warna untuk aplikasi.
4) Membuat widget `ItemCard` untuk menampilkan item yang ada dalam bentuk card dan juga menambahkan `SnackBar`.
5) Menambahkan layout untuk `MyHomePage`, yaitu dengan `AppBar`, `Text`, dan `GridView`
6) Menjalankan aplikasi.

</details>



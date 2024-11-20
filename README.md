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
  <summary><b>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</b></summary>
  
### 1.  Mengapa Perlu Membuat Model untuk Pengambilan atau Pengiriman Data JSON? Apakah Akan Terjadi Error jika Tidak Membuat Model Terlebih Dahulu? 

Pembuatan model sangatlah penting bagi aplikasi yang akan berinteraksi dengan data JSON.

Beberapa alasannya ialah:

**1) Strukturisasi Data:** Model akan membantu untuk memetakan data JSON menjadi objek Dart yang terstruktur. Hal ini akan memudahkan akses dan manipulasi data pada aplikasi Flutter.

**2) Validasi dan Transformasi:** Penggunaan model akan memastikan bahwa data yang diterima/dikirim memiliki format serta tipe yang sesuai. Hal ini akan membantu dalam validasi data serta menghindari kesalahan parsing.

**3) Pengorganisiran Kode:** Penggunaan model membuat kode akan lebih terorganisir dan mudah untuk diakses kembali. Hal ini akan memudahkan pengembangan dan debugging. 

**4) Konsistensi Data:** Model akan memastikan data yang digunakan konsisten.

Apabila model tidak dibuat terlebih dahulu, akan terjadi beberapa kesalahan:

**1) Kesalahan Parsing:** Tanpa model, aplikasi harus memproses data JSON secara manual, yang rentan terhadap kesalahan seperti `TypeError` atau `NullPointerException` ketika struktur data tidak sesuai ekspektasi.

**2) Kode yang Tidak Terstruktur:** Mengelola data tanpa model membuat kode menjadi lebih kompleks dan sulit dipahami, meningkatkan risiko bug dan mempersulit pengembangan lanjutan. Tanpa model, perubahan pada struktur data JSON akan memerlukan penyesuaian manual di berbagai bagian aplikasi, yang bisa menjadi tidak efisien dan rawan kesalahan.

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini.
Library `http` dalam Flutter berfungsi sebagai alat utama untuk melakukan komunikasi antara aplikasi Flutter dan server backend Django. Fungsi-fungsi utamanya meliputi:

**1) Melakukan HTTP Request:** Library ini memungkinkan aplikasi Flutter untuk mengirim berbagai jenis permintaan HTTP seperti GET, POST, PUT, dan DELETE ke server Django.

**2) Mengambil Data dari API:** Dengan `http`, aplikasi dapat mengambil data dari API Django dalam format JSON atau format lainnya yang didukung.

**3) Mengirim Data ke Server:** Selain mengambil data, library ini juga memungkinkan pengiriman data dari Flutter ke Django, misalnya untuk operasi seperti login, registrasi, atau pengiriman formulir.

**4) Mengatur Header dan Body Request:** `http` menyediakan fleksibilitas untuk mengatur header, body, dan metode HTTP yang diperlukan untuk setiap permintaan, memastikan bahwa komunikasi dengan server berjalan sesuai kebutuhan.

**5) Memproses Response:** Library ini menerima respons dari server, yang biasanya dalam bentuk JSON, dan menyediakan metode untuk memparsing dan mengolah data tersebut agar dapat digunakan dalam aplikasi Flutter.

Dalam tugas ini, library `http` digunakan untuk mengambil data item, mengirim data login dan registrasi, serta mengelola berbagai permintaan lainnya yang diperlukan untuk interaksi antara frontend Flutter dan backend Django.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

`CookieRequest` adalah komponen yang berfungsi untuk mengelola sesi autentikasi pengguna melalui cookie dalam aplikasi Flutter yang berkomunikasi dengan backend Django. Berikut adalah fungsinya secara rinci:

**1) Menyimpan Session Cookies:**
Setelah pengguna berhasil login, server Django mengirimkan session cookies yang disimpan oleh `CookieRequest`. Ini memungkinkan aplikasi untuk mengenali sesi pengguna di permintaan berikutnya.

**2) Menyertakan Cookies dalam Setiap Request:**
`CookieRequest` secara otomatis menyertakan cookie autentikasi dalam setiap permintaan HTTP yang dikirim ke server, memastikan bahwa server dapat mengidentifikasi dan memverifikasi status autentikasi pengguna.

**3) Menjaga Status Login Pengguna**
Dengan menyimpan dan mengelola cookies, `CookieRequest` memastikan bahwa status login pengguna tetap terjaga di seluruh komponen aplikasi, sehingga pengguna tidak perlu login ulang setiap kali berpindah halaman atau melakukan tindakan lain dalam aplikasi.

Alasan Instance CookieRequest Perlu Dibagikan ke Semua Komponen di Aplikasi Flutter:

**1) Konsistensi Autentikasi:**
Dengan membagikan instance CookieRequest ke semua komponen, setiap bagian aplikasi dapat mengakses sesi pengguna yang sama. Ini memastikan bahwa autentikasi tetap konsisten dan terintegrasi di seluruh aplikasi.

**2) Efisiensi Pengelolaan Sesi:**
Menyimpan dan mengelola cookies dalam satu instance yang dibagikan menghindari redundansi dan potensi konflik yang bisa terjadi jika setiap komponen mengelola sesi secara terpisah.

**3) Kemudahan Akses Data Pengguna:**
Instance yang dibagikan memungkinkan komponen lain untuk mengakses data pengguna yang terkait dengan sesi, seperti status login, nama, email, dan informasi lainnya, tanpa perlu melakukan permintaan tambahan ke server.

**4) Pengelolaan Keamanan:**
Dengan mengelola cookies secara terpusat, aplikasi dapat lebih mudah menerapkan kebijakan keamanan terkait sesi dan autentikasi, seperti pengaturan waktu kedaluwarsa atau enkripsi data sesi.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dalam aplikasi Flutter yang terhubung dengan backend Django dapat dijelaskan melalui langkah-langkah berikut:

#### 1) Input Data oleh Pengguna
Pengguna memasukkan data melalui form input di aplikasi Flutter, misalnya memasukkan informasi produk, mengisi formulir pendaftaran, atau memasukkan data login.

#### 2) Pengiriman Data ke Server
Setelah data diinput, pengguna menekan tombol submit. Aplikasi Flutter kemudian mengirimkan data tersebut ke server Django menggunakan request HTTP, biasanya dengan metode POST.
Pengiriman ini dilakukan melalui library http atau CookieRequest, dengan data dikemas dalam format JSON sesuai dengan model yang telah dibuat.

#### 3) Pemrosesan di Backend (Django)
Server Django menerima permintaan tersebut melalui endpoint yang sesuai, yang diatur dalam urls.py dan ditangani oleh fungsi atau kelas di views.py.
Data yang diterima diproses, misalnya disimpan ke dalam database, divalidasi, atau digunakan untuk operasi lain yang diperlukan.

#### 4) Pengembalian Respons dari Server
Setelah memproses data, Django mengirimkan respons kembali ke aplikasi Flutter. Respons ini biasanya dalam format JSON yang berisi status operasi (sukses atau gagal), data yang diminta, atau pesan konfirmasi.

#### 5) Penerimaan dan Parsing Respons di Flutter
Aplikasi Flutter menerima respons dari server. Data JSON yang diterima kemudian diparsing menjadi objek Dart menggunakan model yang telah dibuat sebelumnya.

#### 6) Menampilkan Data di UI
Objek Dart yang telah diparsing digunakan untuk memperbarui tampilan UI aplikasi. Misalnya, menampilkan daftar produk yang baru ditambahkan, menampilkan pesan sukses atau error, atau memperbarui status autentikasi pengguna.

#### 7) Pembaharuan UI secara Dinamis
Flutter menggunakan state management untuk memastikan bahwa perubahan data langsung tercermin pada UI, memberikan pengalaman pengguna yang responsif dan interaktif.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dalam aplikasi Flutter yang terhubung dengan backend Django melibatkan beberapa langkah yang saling terkait, mulai dari registrasi pengguna hingga logout. Berikut adalah penjelasan detailnya:

#### a. Registrasi (Register)

**1) Input Data oleh Pengguna:**
Pengguna mengisi formulir registrasi di aplikasi Flutter, memasukkan informasi seperti nama, email, dan password.

**2) Pengiriman Data ke Server:**
Setelah mengisi formulir, pengguna menekan tombol "Register". Aplikasi Flutter kemudian mengirimkan data registrasi ini ke endpoint registrasi Django menggunakan metode POST melalui library http atau CookieRequest.

**3) Pemrosesan di Backend (Django):**
Django menerima data registrasi, memvalidasi informasi yang diberikan (misalnya, memastikan email belum digunakan), dan menyimpan data pengguna baru ke dalam database.

**4) Pengembalian Respons dari Server:**
Setelah proses registrasi berhasil atau jika terjadi error (misalnya, email sudah terdaftar), Django mengirimkan respons kembali ke Flutter dalam format JSON yang berisi status operasi dan pesan terkait.

**5) Menampilkan Notifikasi di Flutter:**
Aplikasi Flutter menampilkan pesan sukses atau error berdasarkan respons yang diterima. Jika registrasi berhasil, pengguna mungkin diarahkan ke halaman login untuk masuk ke akun baru mereka.

#### b. Login

**1) Input Data oleh Pengguna:**
Pengguna memasukkan email dan password di halaman login aplikasi Flutter.

**2) Pengiriman Data ke Server:**
Setelah mengisi kredensial, pengguna menekan tombol "Login". Aplikasi Flutter mengirimkan data login ini ke endpoint login Django menggunakan metode POST melalui CookieRequest.

**3) Pemrosesan di Backend (Django):**
Django memverifikasi kredensial pengguna dengan mencocokkan data yang diterima dengan informasi yang tersimpan di database.
Jika kredensial valid, Django membuat sesi autentikasi dan mengirimkan session cookie kembali ke Flutter.

**4) Menyimpan Status Login di Flutter:**
CookieRequest menyimpan session cookie yang diterima, memastikan bahwa setiap permintaan berikutnya menyertakan cookie tersebut untuk menjaga sesi autentikasi.

**5) Navigasi ke Halaman Utama:**
Setelah login berhasil, aplikasi Flutter mengarahkan pengguna ke halaman utama atau menu utama aplikasi, menandakan bahwa pengguna telah berhasil masuk.

#### c. Logout

**1) Inisiasi Logout oleh Pengguna:**
Pengguna memilih opsi logout di aplikasi Flutter, misalnya melalui tombol "Logout" di menu.

**2) Pengiriman Permintaan Logout ke Server:**
Aplikasi Flutter mengirimkan permintaan logout ke endpoint logout Django menggunakan metode POST melalui CookieRequest.

**3) Pemrosesan di Backend (Django):**
Django menghapus sesi autentikasi pengguna di server, memastikan bahwa session cookie yang terkait juga dihapus atau dinonaktifkan.

**4) Menghapus Status Login di Flutter:**
CookieRequest menghapus session cookie yang tersimpan, menandakan bahwa pengguna telah keluar dari sesi autentikasi.

**5) Navigasi Kembali ke Halaman Login:**
Setelah proses logout selesai, aplikasi Flutter mengarahkan pengguna kembali ke halaman login, memastikan bahwa akses ke halaman yang memerlukan autentikasi dibatasi hingga pengguna login kembali.

### 6. 

</details>

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

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
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
### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
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



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

## Tugas 7

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Jawaban:
`Stateless widget`merupakan suatu widget statis yang seluruh konfigurasinya telah diinisiasi dari awal. Stateless widget tidak memmiliki state (keadaan yang berubah). Contohnya ialah `Text, Icon, IconButton`.

Di lain sisi, stateful widget merupakan suatu widget yang bersifat dinamis sehingga widget dapat diperbarui sesuai dengan user actions atau jika terjadi perubahan data. Conthnya ialah `Checkbox, Radio, Textfield`.

Perbedaan utama dari stateless widget dan stateful widget ialah stateless widget bersifat statis, sedangkan stateful widget bersifat dinamis.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Beberapa widget yang digunakan di proyek ini ialah:
- Scaffold: Digunakan untuk memberikan dasar dari aplikasi, seperti `appBar`, `body`, dan `bottomNavigationBar`
- AppBar: 
- Column dan Row: Digunakan untuk menyusun widget secara vertikal (dengan `column`) dan horizontal (`row`)
- Text: Digunakan untuk menampilkan teks statis
- GridView: Digunakan untuk menyusun item dalam bentuk grid ataupun tabel
- Card: Digunakan untuk menampilkan konten dalam bentuk kartu agar lebih terstruktur
- InkWell: Digunakan untuk menyediakan efek klik dengan animasi untuk menambah interaksi pada item.
- InfoCard: Merupakan widget custom untuk menampilkan informasi berupa NPM, nama, dan kelas.
- ItemCard: Merupakan widget cutom untuk menampilkan ikon dan nama item dalam produk.


3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut
`setState()` merupakan fungsi yang digunakan pada Stateful Widget. Fungsi ini digunakan untuk memperbarui state dan membangun kembali widget yang ada untuk memberikan data terbaru. 

Contoh variabel yang berdampak dalam `setState()`:
- `items`: `setState()` akan diperlukan untuk memperbarui tampilan GridView dengan daftar terbaru dalam ItemHomepage
- `npm, name, className`: `setState()` digunakan untuk menampilkan data baru.

4. Jelaskan perbedaan antara const dengan final.
- `const` digunakan untuk membuat nilai variabel menjadi konstan saat di kompilasi. Nilai ii tidak bisa diubah saat kompilasi maupun runtime. const biasanya digunakan untuk data yang sudah diketahui dan tetap dari awal. 

- `final` digunakan untuk variabel yang nilainya ditetapkan satu kali dan tidak dapat diubah lagi. final dapat menerima nilai saat di runtime.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
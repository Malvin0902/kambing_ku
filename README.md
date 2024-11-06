# KambingKu

**KambingKu** adalah aplikasi E-Commerce yang berfokus pada penjualan kambing secara online. Aplikasi ini menyediakan berbagai fitur untuk melihat daftar produk kambing, menambahkan produk baru, dan juga fungsi logout. Dibuat sebagai bagian dari Tugas Individu 7 oleh **Malvin Muhammad Raqin** dengan NPM **2306275821** untuk kelas **PBP D**.

## Tugas Individu 7

### Jawaban untuk Pertanyaan

1. **Stateless widget dan stateful widget serta perbedaannya**

   Stateless widget adalah widget yang tidak memiliki status yang dapat diubah, sesuai dengan namanya "stateless". Widget ini bersifat immutable, artinya setelah dibangun oleh metode `Widget build()`, mereka tidak dapat mengubah tampilan, data, atau perilakunya. Biasanya, stateless widget digunakan untuk elemen yang tidak berubah seiring waktu, seperti ikon, label, dll. Sementara itu, stateful widget adalah widget yang dapat mengubah statusnya seiring waktu. Widget ini memiliki objek status yang dapat menampung data yang dapat diubah, dan akan berubah tergantung orientasi widget tersebut. Ketika status berubah, widget akan di-render ulang untuk merefleksikan perubahan atau pembaruan tersebut. Ini berguna untuk elemen interaktif yang memerlukan perubahan.

2. **Widget yang digunakan dalam proyek ini dan fungsinya**

    -   **MaterialApp**: Widget utama aplikasi, bertanggung jawab untuk mengatur tema, routing, dan berbagai pengaturan lainnya.
    -   **Scaffold**: Menyediakan struktur visual dasar, termasuk elemen seperti `AppBar`, `Drawer`, `FloatingActionButton`, dan `body` tempat konten utama berada.
    -   **AppBar**: Menampilkan header tetap di bagian atas layar dengan judul, tombol aksi, atau tombol navigasi.
    -   **Padding**: Menambahkan spasi di sekitar atau di dalam widget.
    -   **Card**: Widget yang digunakan untuk blok konten terstruktur (seperti informasi pengguna di `InfoCard`).
    -   **SnackBar**: Pesan sementara yang ditampilkan di bagian bawah layar, dipicu ketika pengguna menekan setiap tombol.

3. **Kegunaan `setState()` dan variabel yang dapat terpengaruh oleh `setState()`**

   Tujuan dari `setState()` adalah untuk memperbarui antarmuka pengguna (UI) sebagai respons terhadap perubahan status dalam `StatefulWidget`. Ketika dipanggil, `setState()` memberikan sinyal bahwa status widget telah berubah. Variabel yang terpengaruh oleh `setState()` adalah semua variabel dalam kelas `State`. Dalam tutorial ini, ada variabel penghitung `{ _counter++; ` yang akan diperbarui oleh `setState()`.

4. **Perbedaan antara kata kunci `const` dan `final`**

   `const` digunakan untuk nilai-nilai yang ditentukan pada waktu kompilasi dan tidak akan berubah. `const` juga bersifat immutable dan diinisialisasi dengan nilai konstan. Jika widget dibuat dengan `const`, maka dianggap konstan dan tidak akan dibangun ulang, yang mengoptimalkan kinerja aplikasi. Sementara itu, `final` digunakan untuk variabel yang ditetapkan satu kali dan tidak dapat diubah, meskipun nilainya dapat ditentukan saat runtime. Variabel `final` bersifat mutable sebelum inisialisasi dan tidak memerlukan nilai konstan pada waktu kompilasi. Jadi, `const` digunakan untuk mengoptimalkan kinerja, sedangkan `final` digunakan untuk menetapkan variabel sekali tanpa memerlukan nilai waktu kompilasi.


5.
### Membuat Proyek Flutter

Pertama-tama, kita harus membuat proyek Flutter baru dengan langkah-langkah berikut:

1. Buka Terminal, Powershell, atau Command Prompt.
2. Buat direktori baru dan masuk ke dalam direktori tersebut untuk proyek Flutter.
3. _Generate_ proyek Flutter baru di terminal dengan nama **kambingku**, lalu masuk ke direktori proyek.

    ```bash
    flutter create kambingku
    cd kambingku
    ```

4. Jalankan proyek melalui Terminal, Powershell, atau Command Prompt.

    ```bash
    flutter run
    ```

5. Pilih salah satu browser atau emulator untuk menjalankan proyek, misalnya nomor 2 untuk Chrome.

Sekarang kita telah berhasil membuat proyek Flutter baru.

### Merapikan Proyek

Agar file proyek lebih mudah dibaca, kita memisahkan file `main.dart` dengan membuat file baru bernama `menu.dart`. Langkah-langkahnya sebagai berikut:

1. Buat file baru bernama `menu.dart` untuk menampilkan menu aplikasi dalam direktori `kambingku/lib/`. Tambahkan pernyataan import `material.dart` untuk mendefinisikan properti visual dan perilaku widget yang akan digunakan.

    ```dart
    import 'package:flutter/material.dart';
    ```

2. Di dalam file `main.dart`, potong kode yang berisi kelas `MyHomePage` dan `ItemCard`, lalu pindahkan kode tersebut ke file `menu.dart` yang baru kita buat.

3. Setelah memindahkan kode ke `menu.dart`, akan muncul kesalahan pada `main.dart` karena kelas `MyHomePage` tidak ditemukan. Untuk mengatasinya, tambahkan import ke `menu.dart` seperti berikut:

    ```dart
    import 'package:kambingku/menu.dart';
    ```

4. Sekarang jika kita mencoba menjalankan proyek lagi, aplikasi akan tetap berjalan dengan benar.

### Membuat Widget

Sekarang kita akan membuat tiga tombol sederhana dengan ikon dan teks menggunakan langkah-langkah berikut.

#### Mengubah Tema Aplikasi

Sekarang, kita akan mengubah tema aplikasi agar sesuai dengan tampilan KambingKu.

1. Buka file `main.dart`.
2. Ubah kode tema aplikasi di file `main.dart` seperti berikut:

    ```dart
    theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,  // Menetapkan warna aksen menjadi hijau
        ),
        scaffoldBackgroundColor: Colors.blue[50], // Latar belakang biru terang untuk layar
        useMaterial3: true,
    ),
    ```

#### Mengubah Menu Halaman menjadi Stateless

1. Pada file `main.dart`, ganti pemanggilan `const MyHomePage(title: 'Flutter Demo Home Page')` dengan `MyHomePage()`.

2. Buka file `menu.dart`, dan ubah kelas `MyHomePage` agar menjadi `StatelessWidget` sebagai berikut:

    ```dart
    class MyHomePage extends StatelessWidget {
      MyHomePage({super.key});
      
      final String npm = '2306275821'; // NPM
      final String name = 'Malvin Muhammad Raqin'; // Nama
      final String className = 'PBP D'; // Kelas
    }
    ```

#### Menambahkan Kartu dengan NPM, Nama, dan Kelas

1. Sebelum membuat kartu, kita deklarasikan tiga variabel `String` berisi `npm`, `name`, dan `className` di dalam `class MyHomePage` di `menu.dart`.

2. Buat kelas baru `InfoCard` di dalam file `menu.dart` untuk menampilkan informasi NPM, Nama, dan Kelas:

    ```dart
    class InfoCard extends StatelessWidget {
      final String title;
      final String content;
    
      const InfoCard({super.key, required this.title, required this.content});
    
      @override
      Widget build(BuildContext context) {
        return Card(
          elevation: 2.0,
          child: Container(
            width: MediaQuery.of(context).size.width / 3.5,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(content),
              ],
            ),
          ),
        );
      }
    }
    ```

#### Menambahkan Tombol dengan Ikon

1. Buat kelas `ItemHomepage` yang berisi atribut dari tombol (nama dan ikon) di dalam file `menu.dart`:

    ```dart
    class ItemHomepage {
      final String name;
      final IconData icon;
      final Color color; 
      
      ItemHomepage(this.name, this.icon, this.color);
    }
    ```

2. Deklarasikan daftar `ItemHomepage` untuk tombol-tombol yang akan kita tambahkan ke dalam kelas `MyHomePage`:

    ```dart
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.list, Colors.blue),
        ItemHomepage("Tambah Produk", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];
    ```

3. Buat kelas `ItemCard` untuk menampilkan tombol dengan pesan `Snackbar` saat tombol ditekan:

    ```dart
    class ItemCard extends StatelessWidget {
      final ItemHomepage item;
    
      const ItemCard(this.item, {super.key});
    
      @override
      Widget build(BuildContext context) {
        return Material(
          color: item.color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              String message = "Kamu telah menekan tombol ${item.name}";
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(message)),
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

#### Menampilkan InfoCard dan ItemCard di MyHomePage

Akhirnya, tambahkan semua kartu di `HomePage` dengan mengubah bagian `Widget build()` di kelas `MyHomePage` sebagai berikut:

  ```dart
  class MyHomePage extends StatelessWidget {
    ...

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'KambingKu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: name),
                  InfoCard(title: 'Class', content: className),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat Datang di KambingKu',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
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

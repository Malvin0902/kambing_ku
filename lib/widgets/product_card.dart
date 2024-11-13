import 'package:flutter/material.dart';
import 'package:kambing_ku/screens/product_entry_form.dart';
import 'package:kambing_ku/screens/menu.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; 

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Menggunakan warna dari item untuk latar belakang
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          String message = "";
          if (item.name == "View Product List") {
            message = "Anda telah menekan tombol Lihat Daftar Produk";
          } else if (item.name == "Add Product") {
            message = "Anda telah menekan tombol Tambah Produk";
          } else if (item.name == "Logout") {
            message = "Anda telah menekan tombol Logout";
          }
          
          // Menampilkan pesan dalam Snackbar
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(message)),
            );

          // Navigasi berdasarkan item yang ditekan
          if (item.name == "View Product List") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          } else if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEntryFormPage(),
              ),
            );
          } else if (item.name == "Logout") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          }
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

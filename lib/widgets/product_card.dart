import 'package:flutter/material.dart';
import 'package:kambing_ku/screens/product_entry_form.dart';
import 'package:kambing_ku/screens/list_productentry.dart';
import 'package:kambing_ku/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color, // Menggunakan warna dari item untuk latar belakang
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
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
                builder: (context) => const KambingEntryPage(),
              ),
            );
          } else if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          } else if (item.name == "Logout") {
            final response = await request.logout(
              'http://localhost:8000/auth/logout/',
            );
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Goodbye, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            }
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

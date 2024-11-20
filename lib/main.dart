import 'package:flutter/material.dart';
import 'package:kambing_ku/screens/login.dart';
import 'package:kambing_ku/screens/menu.dart'; // Sesuaikan path dengan file kamu
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Ditambahkan untuk autentikasi
import 'package:provider/provider.dart'; // Ditambahkan untuk state management

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest(); // Inisialisasi request untuk autentikasi
        return request;
      },
      child: MaterialApp(
        title: 'KambingKu', // Nama aplikasi tetap KambingKu
        theme: ThemeData(
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ).copyWith(
            secondary: Colors.orange, // Warna aksen diatur ke oranye
          ),
          scaffoldBackgroundColor: Colors.teal[50], // Latar belakang terang
          useMaterial3: true, // Opsional, menggunakan desain Material 3
        ),
        home: const LoginPage(), 
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kambing_ku/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KambingKu',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.orange,  // Accent color set to orange
        ),
        scaffoldBackgroundColor: Colors.teal[50], // Light teal background for screens
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
